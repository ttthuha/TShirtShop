//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TShirtOnlineShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class CUSTOMER
    {
        public System.Guid CustomerID { get; set; }

        [Required]
        public string CustomerFullName { get; set; }

        [Required]
        public string CustomerPhoneNumber { get; set; }
        [Required]

        public string CustomerEmail { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string CustomerPassword { get; set; }
    }
}
