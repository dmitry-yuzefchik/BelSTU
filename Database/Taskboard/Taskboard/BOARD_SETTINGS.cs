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
    
    public partial class BOARD_SETTINGS
    {
        public int id { get; set; }
        public byte[] background { get; set; }
        public string primaryColor { get; set; }
        public string secondaryColor { get; set; }
        public string accessToDeleteTask { get; set; }
        public string accessToChangeTask { get; set; }
        public string accessToCreateTask { get; set; }
        public Nullable<int> boardId { get; set; }
    
        public virtual BOARD BOARD { get; set; }
    }
}