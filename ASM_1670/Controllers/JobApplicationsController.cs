using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ASM_1670.Data;
using ASM_1670.Models;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace ASM_1670.Controllers
{
    public class JobApplicationsController : Controller
    {
        private readonly ASM_1670Context _context;

        public JobApplicationsController(ASM_1670Context context)
        {
            _context = context;
        }

        // GET: JobApplications
        public async Task<IActionResult> Index()
        {
            var aSM_1670Context = _context.JobApplication.Include(j => j.Job).Include(j => j.User).ThenInclude(j=>j.Cv);
            return View(await aSM_1670Context.ToListAsync());
        }

        // GET: JobApplications/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var jobApplication = await _context.JobApplication
                .Include(j => j.Job)
                .Include(j => j.User)
                .FirstOrDefaultAsync(m => m.JobApplicationId == id);
            if (jobApplication == null)
            {
                return NotFound();
            }

            return View(jobApplication);
        }

        
        // GET: JobApplications/Create
        [Authorize(Roles = "Job Seekers")]
        public async Task<IActionResult> Create(int jobId)
        {
            if (jobId == null)
            {
                return RedirectToAction("Index", "Jobs");
            }
            var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var job = await _context.Job.FindAsync(jobId);
            var existingApplication = await _context.JobApplication.FirstOrDefaultAsync(j => j.JobId == jobId && j.UserId == currentUserId);
            if (existingApplication != null)
            {
                return RedirectToAction("Index");
            }
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "UserName");
            ViewData["JobId"] = jobId;
            return View();
        }

        // POST: JobApplications/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Job Seekers")]
        public async Task<IActionResult> Create(int jobId,[Bind("JobApplicationId,CoverLetter,JobId,UserId")] JobApplication jobApplication)
        {
            if (ModelState.IsValid)
            {
                var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                jobApplication.UserId = currentUserId;
                jobApplication.JobId = jobId;
                _context.Add(jobApplication);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["JobId"] = new SelectList(_context.Job, "Id", "Id", jobApplication.JobId);
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", jobApplication.UserId);
            return View(jobApplication);
        }

        // GET: JobApplications/Edit/5
        //[Authorize(Roles = "Job Seekers")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var jobApplication = await _context.JobApplication.FindAsync(id);
            if (jobApplication == null)
            {
                return NotFound();
            }
            var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (jobApplication.UserId != currentUserId)
            {
                return Forbid();
            }
            ViewData["JobId"] = new SelectList(_context.Job, "Id", "Id", jobApplication.JobId);
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", jobApplication.UserId);
            return View(jobApplication);
        }

        // POST: JobApplications/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        //[Authorize(Roles = "Job Seekers")]
        public async Task<IActionResult> Edit(int? id, [Bind("JobApplicationId,CoverLetter,JobId,UserId")] JobApplication jobApplication)
        {
            if (id != jobApplication.JobApplicationId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(jobApplication);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!JobApplicationExists(jobApplication.JobApplicationId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["JobId"] = new SelectList(_context.Job, "Id", "Id", jobApplication.JobId);
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", jobApplication.UserId);
            return View(jobApplication);
        }

        // GET: JobApplications/Delete/5
        //[Authorize(Roles = "Job Seekers")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var jobApplication = await _context.JobApplication
                .Include(j => j.Job)
                .Include(j => j.User)
                .FirstOrDefaultAsync(m => m.JobApplicationId == id);
            if (jobApplication == null)
            {
                return NotFound();
            }
            var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (jobApplication.UserId != currentUserId)
            {
                return Forbid();
            }

            return View(jobApplication);
        }

        // POST: JobApplications/Delete/5
        //[Authorize(Roles = "Job Seekers")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int? id)
        {
            var jobApplication = await _context.JobApplication.FindAsync(id);
            if (jobApplication != null)
            {
                _context.JobApplication.Remove(jobApplication);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool JobApplicationExists(int? id)
        {
            return _context.JobApplication.Any(e => e.JobApplicationId == id);
        }
    }
}
