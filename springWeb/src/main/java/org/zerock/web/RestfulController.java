package org.zerock.web;

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
}
