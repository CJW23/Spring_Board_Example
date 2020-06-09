package org.zerock.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.BoardPageMaker;
import org.zerock.domain.CriteriaVO;
import org.zerock.domain.ReplysVO;
import org.zerock.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Inject
	ReplyService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplysVO reply){
		logger.info(reply.toString());
		try {
			service.addReply(reply);
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@RequestMapping(value = "/all/{bid}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplysVO>> listReply(@PathVariable int bid){
		try {
			List<ReplysVO> reply = service.listReply(bid);
			return new ResponseEntity<List<ReplysVO>>(reply, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<ReplysVO>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable int id){
		try {
			service.removeReply(id);
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable int id, @RequestBody ReplysVO reply){
		logger.info(reply.toString());
		try {
			reply.setId(id);
			service.modifyReply(reply);
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/{bid}/{curPage}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPageReply(@PathVariable int bid, @PathVariable int curPage){
		try {
			CriteriaVO cri = new CriteriaVO();
			cri.setCurPage(curPage);
			
			BoardPageMaker pm = new BoardPageMaker(cri);
			pm.setTotalCnt(service.totalReply(bid));
			
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("pm", pm);
			param.put("list", service.listPageReply(bid, cri));
			return new ResponseEntity<Map<String, Object>>(param, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		
	}
	
}
