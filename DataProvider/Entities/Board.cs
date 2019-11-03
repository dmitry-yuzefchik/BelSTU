﻿using System;
using System.Collections.Generic;

namespace DataProvider.Entities
{
    public class Board
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public ICollection<Column> Columns { get; set; }
        public Guid ProjectId { get; set; }
        public Project Project { get; set; }
        public BoardSettings Settings { get; set; }
        public Guid CreatorId { get; set; }
        public User Creator { get; set; }

        public Board()
        {
            Columns = new List<Column>();
        }
    }
}
