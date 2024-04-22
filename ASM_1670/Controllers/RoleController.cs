using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ASM_1670.Data;
using ASM_1670.Models;

namespace ASM_1670.Controllers
{
    [Authorize(Roles = "Admin")]
    public class RoleController : Controller
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ASM_1670Context _context;

        public RoleController(RoleManager<IdentityRole> roleManager, UserManager<ApplicationUser> userManager, ASM_1670Context context )
        {
            _roleManager = roleManager;
            _userManager = userManager;
            _context = context;

        }

        public async Task<IActionResult> Index()
        {
            var roles = await _roleManager.Roles.ToListAsync();
            return View(roles);
        }


        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> RoleManagement()
        {
            ViewBag.AllRoles = _roleManager.Roles.Select(r => r.Name).ToList();

            var users = _userManager.Users.ToList();

            var userRoles = new Dictionary<string, List<string>>();
            foreach (var user in users)
            {
                var roles = _userManager.GetRolesAsync(user).Result;
                userRoles.Add(user.Id, roles.ToList());
            }
            ViewBag.UserRoles = userRoles;

            var userCv = new Dictionary<string, string>();
            foreach (var user in users)
            {
                var cv = _context.Cv.FirstOrDefault(p => p.UserId == user.Id);
                if (cv != null)
                {
                    userCv.Add(user.Id, cv.FullName);
                }
                else
                {
                    userCv.Add(user.Id, string.Empty);
                }
            }
            ViewBag.UserProfiles = userCv;

            return View(users.Where(u => u.Id != _userManager.GetUserId(User)));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]

        public async Task<IActionResult> UpdateRole(string userId, string selectedRole)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
            {
                return NotFound();
            }

            var currentRoles = await _userManager.GetRolesAsync(user);

            if (currentRoles.Contains(selectedRole))
            {
                return RedirectToAction("RoleManagement");
            }

            // Remove current roles
            await _userManager.RemoveFromRolesAsync(user, currentRoles);

            // Add new role
            await _userManager.AddToRoleAsync(user, selectedRole);

            return RedirectToAction("RoleManagement");
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(IdentityRole model)
        {
            if (!await _roleManager.RoleExistsAsync(model.Name))
            {
                await _roleManager.CreateAsync(new IdentityRole(model.Name));
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var role = await _roleManager.FindByIdAsync(id);
            if (role == null)
            {
                return NotFound();
            }

            return View(role);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, IdentityRole model)
        {
            if (id != model.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var role = await _roleManager.FindByIdAsync(id);
                    if (role != null)
                    {
                        role.Name = model.Name;
                        var result = await _roleManager.UpdateAsync(role);
                        if (result.Succeeded)
                        {
                            return RedirectToAction(nameof(Index));
                        }
                    }
                    return View(model);
                }
                catch (DbUpdateConcurrencyException)
                {
                    return NotFound();
                }
            }
            return View(model);
        }

        [HttpGet]
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var role = await _roleManager.FindByIdAsync(id);
            if (role == null)
            {
                return NotFound();
            }

            return View(role);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var role = await _roleManager.FindByIdAsync(id);
            if (role != null)
            {
                var result = await _roleManager.DeleteAsync(role);
                if (result.Succeeded)
                {
                    return RedirectToAction(nameof(Index));
                }
            }
            return NotFound();
        }
    }
}
