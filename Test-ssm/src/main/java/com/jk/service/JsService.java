package com.jk.service;

import java.util.List;

import com.jk.entity.Js;

public interface JsService {

	List jslist(Js js) throws Exception;

	void jsadd(Js js)throws Exception;

	void deletejs(String ids)throws Exception;

	Js toupdatejs(Js js)throws Exception;

	void updatejs(Js js)throws Exception;

	Long count(Js js)throws Exception;



}
