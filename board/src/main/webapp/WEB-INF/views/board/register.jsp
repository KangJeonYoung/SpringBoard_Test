<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="utf-8">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../../resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../../resources/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Paper Dashboard 2 by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="<%=request.getContextPath()%>/resources/assets/demo/demo.css" rel="stylesheet" />

		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
		<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
		
        <script type="text/javascript">
            $(document).ready(function(){
            	
            	//--페이지 셋팅
            	var totalPage = ${totalPage}; //전체 페이지
            	var startPage = ${startPage}; //현재 페이지
            	
            	var pagination = "";
            	
            	//--페이지네이션에 항상 10개가 보이도록 조절
            	var forStart = 0;
            	var forEnd = 0;
            	
            	if((startPage-5) < 1){
            		forStart = 1;
            	}else{
            		forStart = startPage-5;
            	}
            	
            	if(forStart == 1){
            		
            		if(totalPage>6){
            			forEnd = 7;
            		}else{
            			forEnd = totalPage;
            		}
            		
            	}else{
            		
            		if((startPage+4) > totalPage){
                		
            			forEnd = totalPage;
                		
                		if(forEnd>6){
                			forStart = forEnd-6
                		}
                		
                	}else{
                		forEnd = startPage+4;
                	}
            	}
            	//--페이지네이션에 항상 10개가 보이도록 조절
            	
            	//전체 페이지 수를 받아 돌린다.
            	for(var i = forStart ; i<= forEnd ; i++){
            		if(startPage == i){
            			pagination += ' <button name="page_move" start_page="'+i+'" disabled>'+i+'</button>';
            		}else{
            			pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >'+i+'</button>';
            		}
            	}
            	
            	//하단 페이지 부분에 붙인다.
            	$("#pagination").append(pagination);
            	//--페이지 셋팅
            	
            	
            	$("a[name='subject']").click(function(){
            		
            		location.href = "/board/view?id="+$(this).attr("content_id");
            		
            	});
            	
            	$("#write").click(function(){
            		location.href = "/board/edit";
            	});
            	            	
            	$(document).on("click","button[name='page_move']",function(){
            		
                    var visiblePages = 7;//리스트 보여줄 페이지
                    
                    $('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
                    $('#visiblePages').val(visiblePages);
                    
                    $("#frmSearch").submit();
                    
            	});
            	
            });
        </script>

</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="<%=request.getContextPath()%>/resources/assets/img/logo-small.png">
          </div>
          <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          Creative Tim
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="./dashboard.jsp">
              <i class="nc-icon nc-bank"></i>
              <p> 메인 화면 </p>
            </a>
          </li>
          <li>
            <a href="./user.jsp">
              <i class="nc-icon nc-single-02"></i>
              <p> 사용자 정보 </p>
            </a>
          </li>
          <li>
            <a href="./company.jsp">
              <i class="nc-icon nc-bank"></i>
              <p> 채용 기업 </p>
            </a>
          </li>
          <li>
            <a href="./company_tip.jsp">
              <i class="nc-icon nc-bulb-63"></i>
              <p> 취업 팁 </p>
            </a>
          </li>
          <li class="active ">
            <a href="./test_free_board.jsp">
              <i class="nc-icon nc-single-copy-04"></i>
              <p> 자유 게시판 </p>
            </a>
          </li>
          <li>
            <a href="./user.html">
              <i class="nc-icon nc-settings"></i>
              <p> FAQ </p>
            </a>
          </li>
          <li>
            <a href="./tables.html">
              <i class="nc-icon nc-settings-gear-65"></i>
              <p> 문의 사항 </p>
            </a>
          </li>
          <li>
			            <!--Start of Tawk.to Script-->
			<script type="text/javascript">
			var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
			(function(){
			var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
			s1.async=true;
			s1.src='https://embed.tawk.to/5eb4cc5081d25c0e5849e50a/default';
			s1.charset='UTF-8';
			s1.setAttribute('crossorigin','*');
			s0.parentNode.insertBefore(s1,s0);
			})();
			</script>
			<!--End of Tawk.to Script-->
          </li>
<!--           <li class="active-pro">
            <a href="./upgrade.html">
              <i class="nc-icon nc-spaceship"></i>
              <p>Upgrade to PRO</p>
            </a>
          </li> -->
        </ul>
      </div>
    </div>
    <div class="main-panel">
    
	<%@include file="../includes/header.jsp" %>
	
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header ">
                	<h3>Board Register</h3>
                <!-- <p class="card-category"> 최신 업데이트 순 </p> -->
              </div>
              <div class="card-body ">
                
				<div class="row">
	<div class="col-lg-12">
		<div class ="panel panel-default">
		
			<!-- <div class="panel-heading">Board Register</div> -->
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'>
					</div>
					
					<div class ="form-group">
						<label>Text area</label>
						<!-- <textarea class = "form-control" rows="3" name ='content'></textarea> -->
						<textarea class = "form-control" name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
						</div>
						
						<div class = "form-group">
							<label>Writer</label> <input class = "form-control" name='writer'>
						</div>
						<button type="submit" class = "btn btn-default">Submit Button</button>
						<button type="reset" class = "btn btn-default">Reset Button</button>
				</form>
			</div>
			<!-- end panel-body -->

				
				


		</div>
	</div>


              </div>
              <div class="card-footer ">

              </div>
            </div>
          </div>

        </div>
      </div>
      <footer class="footer footer-black  footer-white ">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
            </nav>
            <div class="credits ml-auto">
             <span class="copyright">
                © <script>
                  document.write(new Date().getFullYear())
                </script> <!-- <i class="fa fa-heart heart"></i> --> Kang Jeon Young
              </span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="<%=request.getContextPath()%>/resources/assets/js/core/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/core/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="<%=request.getContextPath()%>/resources/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="<%=request.getContextPath()%>/resources/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="<%=request.getContextPath()%>/resources/assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="<%=request.getContextPath()%>/resources/assets/demo/demo.js"></script>
</body>

</html>