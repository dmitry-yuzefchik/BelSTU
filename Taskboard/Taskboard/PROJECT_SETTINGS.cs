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
    
    public partial class PROJECT_SETTINGS
    {
        public int id { get; set; }
        public byte[] background { get; set; }
        public string accessToDeleteBoard { get; set; }
        public string accessToChangeBoard { get; set; }
        public string accessToCreateBoard { get; set; }
        public Nullable<int> projectId { get; set; }
    
        public virtual PROJECT PROJECT { get; set; }
    }
}
