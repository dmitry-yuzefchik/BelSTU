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
    
    public partial class COLUMN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public COLUMN()
        {
            this.TASKS = new HashSet<TASKS>();
        }
    
        public int id { get; set; }
        public string title { get; set; }
        public Nullable<int> boardId { get; set; }
    
        public virtual BOARD BOARD { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TASKS> TASKS { get; set; }
    }
}
