package com.kjy.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kjy.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("�깉濡� �옉�꽦�븯�뒗 湲�");
		board.setContent("�깉濡� �옉�꽦�븯�뒗 �궡�슜");
		board.setWriter("newbie");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	 @Test
	 public void testInsertSelectKey() {
		 BoardVO board = new BoardVO();
		 board.setTitle("�깉濡� �옉�꽦�븯�뒗 湲� select key");
		 board.setContent("�깉濡� �옉�꽦�븯�뒗 �궡�슜 select key");
		 board.setWriter("newbie");
		 
		 mapper.insertSelectKey(board);
		 
		 log.info(board);
	 }
	
	@Test
	public void testRead() {
		
		//議댁옱�븯�뒗 寃뚯떆臾� 踰덊샇濡� �뀒�뒪�듃
		BoardVO board = mapper.read(1L);
		
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT:"+mapper.delete(3L));
	}
	
	 @Test
	 public void testUpdate() {
		 BoardVO board = new BoardVO();
		 board.setBno(3L);	// 議댁옱�븯�뒗 踰덊샇�씤吏� 癒쇱� �솗�씤
		 board.setTitle("�닔�젙�맂 �젣紐�");
		 board.setContent("�닔�젙�맂 �궡�슜");
		 board.setWriter("user00");
		 
		 int count = mapper.update(board);
		 log.info("UPDATE COUNT: " + count);
	 }
}
