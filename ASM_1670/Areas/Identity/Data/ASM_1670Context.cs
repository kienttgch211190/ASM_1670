using ASM_1670.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace ASM_1670.Data;

public class ASM_1670Context : IdentityDbContext<ApplicationUser>  
{
    public ASM_1670Context(DbContextOptions<ASM_1670Context> options)
        : base(options)
    {
    }
    public DbSet<Job> Job { get; set; } = default!;

    public DbSet<JobApplication> JobApplication { get; set; }

    public DbSet<Cv> Cv { get; set; }

    public DbSet<ApplicationUser> ApplicationUser { get; set; }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        // Customize the ASP.NET Identity model and override the defaults if needed.
        // For example, you can rename the ASP.NET Identity table names and more.
        // Add your customizations after calling base.OnModelCreating(builder);
        builder.Entity<ApplicationUser>()
          .HasOne(u => u.Cv)
          .WithOne(p => p.User)
          .HasForeignKey<Cv>(p => p.UserId);
    }
}
