//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Taskboard
{
    using System;
    using System.Collections.Generic;
    
    public partial class TEAM_USER
    {
        public int id { get; set; }
        public Nullable<int> userId { get; set; }
        public Nullable<int> teamId { get; set; }
        public string role { get; set; }
    
        public virtual TEAM TEAM { get; set; }
        public virtual USER USER { get; set; }
    }
}
