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
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Authorization;

namespace ASM_1670.Controllers
{
    public class JobsController : Controller
    {
        private readonly ASM_1670Context _context;
        private readonly IWebHostEnvironment _webHostEnvironment ;


        public JobsController(ASM_1670Context context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        // GET: Jobs
        public async Task<IActionResult> Index()
        {
            IQueryable<Job> jobsQuery = _context.Job.Where(j => j.Status == "Approved").Include(j => j.User);
            //lấy ra danh sách công việc nào có status = Approved.
            var job = await jobsQuery.ToListAsync();
            return View(job);
        }

        [Authorize(Roles = "Employers")]
        public async Task<IActionResult> MyJob()
        {
            // Lấy UserId của người dùng hiện tại
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            // Lấy danh sách công việc thuộc về người dùng hiện tại
            var userJobs = await _context.Job.Where(j => j.UserId == userId).ToListAsync();

            return View(userJobs);
        }

        // GET: Jobs/PendingJobs
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> PendingJobs()
        {
            var pendingJobs = _context.Job.Where(j => j.Status == "Pending").Include(j => j.User);
            //lấy ra nhưng công viec co status = pending.
            return View(pendingJobs);
        }

        // POST: Jobs/ApproveJob/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ApproveJob(int id)
        {
            var job = await _context.Job.FindAsync(id);
            if (job == null)
            {
                return NotFound();
            }

            job.Status = "Approved";
            //sửa trường status = approved 
            _context.Job.Update(job); //update 
            await _context.SaveChangesAsync(); //lưu vào database 
            return RedirectToAction(nameof(PendingJobs));
        }

        // POST: Jobs/RejectJob/5sssss
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> RejectJob(int id)
        {
            var job = await _context.Job.FindAsync(id);
            if (job == null)
            {
                return NotFound();
            }
            _context.Job.Remove(job); //nếu từ chối thì xóa job khỏi database luôn..
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(PendingJobs));
        }
        // GET: Jobs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var job = await _context.Job
                .Include(j => j.User).ThenInclude(j=>j.Cv)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (job == null)
            {
                return NotFound();
            }

            return View(job);
        }

        // GET: Jobs/Create
        [Authorize(Roles = "Admin,Employers")]

        public IActionResult Create()
        {
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "LastName");
            return View();
        }

        // POST: Jobs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin,Employers")]

        public async Task<IActionResult> Create([Bind("Id,UserId,Title,Description,Qualifications,Salary,Location,DeadLine,JobImage,Status")] Job job)
        {
            var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //lấy id user đang login
            job.UserId = currentUserId;
            //gán user id bằng id của user đang login
            job.Status = "Pending";
            //gán status = pending để job up lên luôn luôn chuyển đến trang job cần phê duyệt.
            if (ModelState.IsValid)
            {
                if (job.JobImage != null)
                {
                    string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "images");
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + job.JobImage.FileName;
                    string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        await job.JobImage.CopyToAsync(fileStream);
                    }
                    job.JobPicture = "/images/" + uniqueFileName;
                }
                _context.Add(job);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", job.UserId);
            return View(job);
        }

        // GET: Jobs/Edit/5
        [Authorize(Roles = "Admin,Employers")]

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var job = await _context.Job.FindAsync(id);
            if (job == null)
            {
                return NotFound();
            }
            var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (job.UserId!= currentUserId)
            {
                return Forbid();
            }
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", job.UserId);
            return View(job);
        }

        // POST: Jobs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin,Employers")]

        public async Task<IActionResult> Edit(int? id, [Bind("Id,UserId,Title,Description,Qualifications,Salary,Location,DeadLine,JobImage,Status")] Job job)
        {
            if (id != job.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var jobToUpdate = await _context.Job.FindAsync(id);
                    if (jobToUpdate == null)
                    {
                        return NotFound();
                    }

                    var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                    if (jobToUpdate.UserId != currentUserId)
                    {
                        return Forbid();
                    }

                    jobToUpdate.Title = job.Title;
                    jobToUpdate.Description = job.Description;
                    jobToUpdate.Qualifications = job.Qualifications;
                    jobToUpdate.Location = job.Location;
                    jobToUpdate.Salary = job.Salary;
                    jobToUpdate.DeadLine = job.DeadLine;

                    if (job.JobImage != null)
                    {
                        string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "images");
                        string uniqueFileName = Guid.NewGuid().ToString() + "_" + job.JobImage.FileName;
                        string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            await job.JobImage.CopyToAsync(fileStream);
                        }
                        jobToUpdate.JobPicture = "/images/" + uniqueFileName;
                    }
                    _context.Update(jobToUpdate);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!JobExists(job.Id))
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
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", job.UserId);
            return View(job);
        }

        // GET: Jobs/Delete/5
        [Authorize(Roles = "Admin,Employers")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var job = await _context.Job
                .Include(j => j.User)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (job == null)
            {
                return NotFound();
            }
            var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (job.UserId != currentUserId)
            {
                return Forbid();
            }


            return View(job);
        }

        // POST: Jobs/Delete/5
        [Authorize(Roles = "Admin,Employers")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int? id)
        {
            var job = await _context.Job.FindAsync(id);
            if (job != null)
            {
                _context.Job.Remove(job);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction("MyJob");
        }

        private bool JobExists(int? id)
        {
            return _context.Job.Any(e => e.Id == id);
        }
    }
}
