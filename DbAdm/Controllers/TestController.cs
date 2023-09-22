﻿using Base.Models;
using Base.Services;
using BaseApi.Controllers;
using BaseWeb.Services;
using DbAdm.Services;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace DbAdm.Controllers
{
    public class TestController : ApiCtrl
    {
        public async Task<ActionResult> Read()
        {
			//for read view
			ViewBag.Projects = await _XpCode.GetProjectsAsync();
			ViewBag.YesNos = await _XpCode.GetYesNosAsync();
            return View();
        }

        [HttpPost]
        public async Task<ContentResult> GetPage(DtDto dt)
        {
            return JsonToCnt(await new TestRead().GetPage(Ctrl, dt));
        }

        private TestEdit EditService()
        {
            return new TestEdit(Ctrl);
        }

        [HttpPost]
        public async Task<ContentResult> GetUpdJson(string key)
        {
            return JsonToCnt(await EditService().GetUpdJsonAsync(key));
        }

        [HttpPost]
        public async Task<ContentResult> GetViewJson(string key)
        {
            return JsonToCnt(await EditService().GetViewJsonAsync(key));
        }

        [HttpPost]
        public async Task<JsonResult> Create(string json)
        {
            return Json(await EditService().CreateAsync(_Str.ToJson(json)));
        }

        [HttpPost]
        public async Task<JsonResult> Update(string key, string json)
        {
            return Json(await EditService().UpdateAsync(key, _Str.ToJson(json)));
        }

        [HttpPost]
        public async Task<JsonResult> Delete(string key)
        {
            return Json(await EditService().DeleteAsync(key));
        }


    }//class
}