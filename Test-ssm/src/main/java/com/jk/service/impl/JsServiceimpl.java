package com.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.dao.JsDao;
import com.jk.entity.Js;
import com.jk.service.JsService;
@Service
public class JsServiceimpl implements JsService {
		@Autowired
		private JsDao dao;

		@Override
		public List jslist(Js js) throws Exception {
			
			return dao.jslist(js);
		}

		@Override
		public void jsadd(Js js) throws Exception {
			dao.jsadd(js);
		}

		@Override
		public void deletejs(String ids) throws Exception {
			String[] idss = ids.split(",");
			dao.deletejs(idss);
			
		}

		@Override
		public Js toupdatejs(Js js) throws Exception {
			return dao.toupdatejs(js);
		}

		@Override
		public void updatejs(Js js) throws Exception {
			dao.updatejs(js);
		}

		@Override
		public Long count(Js js) throws Exception {
			return dao.count(js);
		}
}
