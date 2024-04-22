using System.ComponentModel.DataAnnotations.Schema;

namespace ASM_1670.Models
{
    public class Job
    {
        public int? Id { get; set; }
        public string? UserId { get; set; }
        public ApplicationUser? User { get; set; }
        public string? Title { get; set; }
        public string? Description { get; set; }
        public string? Qualifications { get; set; }
        public decimal? Salary { get; set; }
        public string? Location { get; set; }
        public DateTime? DeadLine { get; set; }
        public string? JobPicture { get; set; }
        [NotMapped]
        public IFormFile? JobImage { get; set; }
        public ICollection<JobApplication>? JobApplications { get; set; }
        public string? Status { get; set; }
    }
}
