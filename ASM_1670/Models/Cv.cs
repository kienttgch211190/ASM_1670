using System.ComponentModel.DataAnnotations.Schema;

namespace ASM_1670.Models
{
    public class Cv
    {
        public int CvId { get; set; }
        public string? UserId { get; set; }
        public ApplicationUser? User { get; set; }
        public string? Description { get; set; }
        public string? FullName { get; set; }
        public string? Address { get; set; }
        public string? Skill { get; set; }
        public string? CvPicture { get; set; }
        public string? Experience { get; set; }
        [NotMapped]
        public IFormFile? CvImage { get; set; }
    }
}
