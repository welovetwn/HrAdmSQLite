﻿using System.Collections.Generic;

namespace Base.Models
{
    /// <summary>
    /// menu item
    /// </summary>
    public class MenuDto
    {
        public MenuDto()
        {
            Items = new List<MenuDto>();
        }

        //program Id
        public string Code { get; set; }

        //program name
        public string Name { get; set; }

        //if emtpy, means has child menu
        public string Url { get; set; }

        //sort
        public long Sort { get; set; }  //sqlite Int64問題,由 int改成long

        //icon class name
        public string Icon { get; set; }

        //sub menu items
        public List<MenuDto> Items { get; set; }
    }
}
