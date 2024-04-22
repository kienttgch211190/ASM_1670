using Microsoft.AspNetCore.Identity;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace ASM_1670.Models
{
    public class ApplicationUser : IdentityUser
    {
        public Cv? Cv { get; set; }
        public ICollection<JobApplication>? JobApplications { get; set; }
        public ICollection<Job>? Job { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
    }
}
