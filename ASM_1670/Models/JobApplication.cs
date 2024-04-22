using System.ComponentModel.DataAnnotations.Schema;

namespace ASM_1670.Models
{
    public class JobApplication
    {
        public int? JobApplicationId { get; set; }
        public string CoverLetter { get; set; } = "";
        public int? JobId { get; set; }
        public Job? Job { get; set; }
        public string? UserId { get; set; }
        public ApplicationUser? User { get; set; }

    }
}
