package com.jk.dao;

import java.util.List;

import com.jk.entity.Js;

public interface JsDao {

	List jslist(Js js) throws Exception;

	void jsadd(Js js)throws Exception;

	void deletejs(String[] idss)throws Exception;

	Js toupdatejs(Js js)throws Exception;

	void updatejs(Js js)throws Exception;

	Long count(Js js)throws Exception;

}
