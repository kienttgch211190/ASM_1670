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
using static System.Runtime.InteropServices.JavaScript.JSType;
using Microsoft.AspNetCore.Authorization;

namespace ASM_1670.Controllers
{
    public class CvsController : Controller
    {
        private readonly ASM_1670Context _context;
        private readonly IWebHostEnvironment _webHostEnvironment ;

        public CvsController(ASM_1670Context context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        // GET: Cvs
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Index()
        {
            var aSM_1670Context = _context.Cv.Include(c => c.User);
            return View(await aSM_1670Context.ToListAsync());
        }

        // GET: Cvs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cv = await _context.Cv
                .Include(c => c.User)
                .FirstOrDefaultAsync(m => m.CvId == id);
            if (cv == null)
            {
                return NotFound();
            }

            return View(cv);
        }

        public async Task<IActionResult> MyCv()
        {
            if (User.Identity.IsAuthenticated)
            {
                string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var cv = await _context.Cv
                    .Include(p => p.User)
                    .FirstOrDefaultAsync(m => m.UserId == userId);

                if (cv != null)
                {
                    return View("Details", cv);
                }
                else
                {
                    return RedirectToAction("Create", "Cvs");
                }
            }
            else
            {
                return Forbid();
            }
        }

        // GET: Cvs/Create
        public IActionResult Create()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var existingProfile = _context.Cv.FirstOrDefault(p => p.UserId == userId);
            if (existingProfile != null)
            {
                return RedirectToAction("Edit", new { id = existingProfile.CvId });
            }
            return View();
        }
        // POST: Cvs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CvId,UserId,Description,FullName,Address,Skill,CvImage,Experience")] Cv cv)
        {
            if (ModelState.IsValid)
            {
                string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                cv.UserId = userId;
                if (cv.CvImage != null)
                {
                    string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "images");
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + cv.CvImage.FileName;
                    string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        await cv.CvImage.CopyToAsync(fileStream);
                    }
                    cv.CvPicture = "/images/" + uniqueFileName;
                }
                _context.Add(cv);
                await _context.SaveChangesAsync();
                return RedirectToAction("MyCv");
            }
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "Id", cv.UserId);
            return View(cv);
        }

        // GET: Cvs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cv = await _context.Cv.FindAsync(id);
            if (cv == null)
            {
                return NotFound();
            }
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (cv.UserId != userId)
            {
                return Forbid();
            }
            ViewData["UserId"] = new SelectList(_context.ApplicationUser, "Id", "UserName", cv.UserId);
            return View(cv);
        }

        // POST: Cvs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CvId,UserId,Description,FullName,Address,Skill,CvImage,Experience")] Cv cv)
        {
            if (id != cv.CvId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    string currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                    cv.UserId = currentUserId;
                    var profileToUpdate = await _context.Cv.FindAsync(id);
                    if (profileToUpdate == null)
                    {
                        return NotFound();
                    }

                    profileToUpdate.UserId = cv.UserId;
                    profileToUpdate.FullName = cv.FullName;
                    profileToUpdate.Address = cv.Address;
                    profileToUpdate.Description = cv.Description;
                    profileToUpdate.Skill = cv.Skill;
                    profileToUpdate.Experience = cv.Experience;

                    if (cv.CvImage != null)
                    {
                        string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "images");
                        string uniqueFileName = Guid.NewGuid().ToString() + "_" + cv.CvImage.FileName;
                        string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            await cv.CvImage.CopyToAsync(fileStream);
                        }
                        profileToUpdate.CvPicture = "/images/" + uniqueFileName;
                    }

                    _context.Update(profileToUpdate);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CvExists(cv.CvId))
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
            return View(cv);
        }

        // GET: Cvs/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cv = await _context.Cv
                .Include(c => c.User)
                .FirstOrDefaultAsync(m => m.CvId == id);
            if (cv == null)
            {
                return NotFound();
            }
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (cv.UserId != userId)
            {
                return Forbid();
            }

            return View(cv);
        }

        // POST: Cvs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var cv = await _context.Cv.FindAsync(id);
            if (cv != null)
            {
                _context.Cv.Remove(cv);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CvExists(int id)
        {
            return _context.Cv.Any(e => e.CvId == id);
        }
    }
}
