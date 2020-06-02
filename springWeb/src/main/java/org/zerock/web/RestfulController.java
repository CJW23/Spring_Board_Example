package org.zerock.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ReplysVO;
import org.zerock.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class RestfulController {
	private static final Logger logger = LoggerFactory.getLogger(RestfulController.class);
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
	
	@RequestMapping(value = "/{bid}", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@RequestBody ReplysVO reply){
		logger.info(reply.toString());
		try {
			service.modifyReply(reply);
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
}
