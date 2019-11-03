﻿using System;

namespace DataProvider.Entities
{
    public class CommentAttachment
    {
        public Guid Id { get; set; }
        public Comment Comment { get; set; }
        public string FileName { get; set; }
        public string MimeType { get; set; }
        public string Extension { get; set; }
        public string AttachedFilePath { get; set; }
    }
}
