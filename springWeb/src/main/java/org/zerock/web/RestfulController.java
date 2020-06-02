package org.zerock.web;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ProductVO;

@RestController
@RequestMapping("/rest")
public class RestfulController {
	
	@RequestMapping("/a")
	public ProductVO aTest() {
		ProductVO product = new ProductVO("awd", 20900);
		return product;
	}
	
	@RequestMapping("/b")
	public ResponseEntity<ProductVO> bTest(){
		ProductVO product = new ProductVO("awd", 20900);
		return new ResponseEntity<ProductVO>(product, HttpStatus.NOT_FOUND);
	}
}
