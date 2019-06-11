<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자 페이지</title>

<!-- Custom fonts for this template-->
<link href="Resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="Resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
@import
   url('https://fonts.googleapis.com/css?family=Audiowide|Comfortaa|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR|Poiret+One|Syncopate&display=swap')
   ;

#nav_menu * {
   margin: 0 auto;
}

.fixedMenu {
   position: fixed;
   background: #fff;
   z-index: 999;
}

.fixedMenuNav {
   background: #007bff;
   box-shadow: 1px 1px 5px #444;
}

.fixedMenu .nav-link {
   color: #fff;
   font-weight: bold;
}

#logo {
   font-family: 'Poiret One', cursive;
   font-weight: bold;
   text-shadow: -1px -1px 0 #FFBF00, 1px -1px 0 #FFBF00, -1px 1px 0 #FFBF00,
      1px 1px 0 #FFBF00;
}

.fixMenu-text {
   postion: relative;
   top: 10px;
}

.logoLi {
   font-family: 'Noto Sans KR', sans-serif;
   text-shadow: 0 0 1px #5882FA;
}

.logoLi:hover {
   opacity: 0.7;
}

.fixedMenuNav div {
   text-align: center;
   font-size: 20px;
}

.card-body a {
   color: gray;
}

.card-body a:hover {
   font-weight: bold;
}

.boardTitle div:nth-child(2) {
   text-align: right;
}

.moreBtn:hover {
   font-weight: bold;
}

.card80 {
   background-color: pink;
   border-radius: 4px;
}

.card90 {
   background-color: #ffa03a;
   border-radius: 4px;
}

.bar80 {
   background-color: pink;
}

.bar90 {
   background-color: #ffa03a;
}
</style>
<script>
                    $(function() {                              // 회원 아이디 조회 결과 반환
                        $("#button-addon2").click(function(){
                            $.ajax({
                                url : "emailCheck.admin",
                                type : "post",
                                data : {
                                    email : $("#email").val()
                                }
                            }).done(function(resp){
                                if(resp==1){
                                    window.open("userManage.admin", "width=300px, height=300px");
                                    $("#email").val(""); 
                                }else{
                                    alert("존재하지 않는 아이디 입니다.");
                                }
                            })
                        })
                    })
                </script>
</head>
<body id="page-top">
   <!-- ================================================= 고정메뉴 ================================================= -->
   <div class="container-fluid fixedMenu">
      <div class="row fixedMenuNav">
         <div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
         <div class="col-lg-10 col-md-12 col-sm-12 col-xs-12">
            <ul class="nav justify-content-center fixMenu-text pb-3">
               <li id="logo" class="nav-item"><a class="nav-link active"
                  href="#">WUYAKO</a></li>
               <li class="nav-item logoLi"><a class="nav-link"
                  href="goMain.win">메인페이지</a></li>
               <li class="nav-item logoLi"><a class="nav-link"
                  href="translateMenu.go">학습하기</a></li>
               <li class="nav-item logoLi"><a class="nav-link"
                  href="goInfo.win">사이트 소개</a></li>
               <li class="nav-item logoLi"><a class="nav-link"
                  href="list.board03?noticeCurrentPage=1">공지사항</a></li>
               <li class="nav-item logoLi"><a class="nav-link"
                  href="list.board01?freeCurrentPage=1">자유게시판</a></li>
               <li class="nav-item logoLi"><a class="nav-link"
                  href="list.board02?qnaCurrentPage=1">문의하기</a></li>
               <c:if test="${type==4}">
                  <li class="nav-item"><a class="nav-link" href="goAdmin.admin">관리자
                        페이지</a></li>
               </c:if>
            </ul>
         </div>
         <div class="col-lg-1 col-md-3 col-sm-12 col-xs-12 d-none d-md-block"></div>
      </div>
   </div>

   <!-- ================================================= Page Wrapper ================================================= -->
   <div id="wrapper">

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Sidebar Toggle (Topbar) -->
         <button id="sidebarToggleTop"
            class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
         </button>

         <!-- Topbar Search -->
         <form
            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
               <div class="input-group-append"></div>
            </div>
         </form>

         <!-- Topbar Navbar -->
         <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none"><a
               class="nav-link dropdown-toggle" href="#" id="searchDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
            </a> <!-- Dropdown - Messages -->
               <div
                  class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                  aria-labelledby="searchDropdown">
                  <form class="form-inline mr-auto w-100 navbar-search">
                     <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                           placeholder="Search for..." aria-label="Search"
                           aria-describedby="basic-addon2">
                        <div class="input-group-append">
                           <button class="btn btn-primary" type="button">
                              <i class="fas fa-search fa-sm"></i>
                           </button>
                        </div>
                     </div>
                  </form>
               </div></li>


            <!-- Dropdown - Alerts -->
            <div
               class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
               aria-labelledby="alertsDropdown">
               <h6 class="dropdown-header">Alerts Center</h6>
               <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                     <div class="icon-circle bg-primary">
                        <i class="fas fa-file-alt text-white"></i>
                     </div>
                  </div>
                  <div>
                     <div class="small text-gray-500">December 12, 2019</div>
                     <span class="font-weight-bold">A new monthly report is
                        ready to download!</span>
                  </div>
               </a> <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                     <div class="icon-circle bg-success">
                        <i class="fas fa-donate text-white"></i>
                     </div>
                  </div>
                  <div>
                     <div class="small text-gray-500">December 7, 2019</div>
                     $290.29 has been deposited into your account!
                  </div>
               </a> <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                     <div class="icon-circle bg-warning">
                        <i class="fas fa-exclamation-triangle text-white"></i>
                     </div>
                  </div>
                  <div>
                     <div class="small text-gray-500">December 2, 2019</div>
                     Spending Alert: We've noticed unusually high spending for your
                     account.
                  </div>
               </a> <a class="dropdown-item text-center small text-gray-500" href="#">Show
                  All Alerts</a>
            </div>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1"><a
               class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> </a> <!-- Dropdown - Messages -->
               <div
                  class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="messagesDropdown">
                  <h6 class="dropdown-header">Message Center</h6>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle"
                           src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                        <div class="status-indicator bg-success"></div>
                     </div>
                     <div class="font-weight-bold">
                        <div class="text-truncate">Hi there! I am wondering if you
                           can help me with a problem I've been having.</div>
                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                     </div>
                  </a> <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle"
                           src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                        <div class="status-indicator"></div>
                     </div>
                     <div>
                        <div class="text-truncate">I have the photos that you
                           ordered last month, how would you like them sent to you?</div>
                        <div class="small text-gray-500">Jae Chun · 1d</div>
                     </div>
                  </a> <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle"
                           src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                        <div class="status-indicator bg-warning"></div>
                     </div>
                     <div>
                        <div class="text-truncate">Last month's report looks
                           great, I am very happy with the progress so far, keep up the
                           good work!</div>
                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                     </div>
                  </a> <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle"
                           src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                        <div class="status-indicator bg-success"></div>
                     </div>
                     <div>
                        <div class="text-truncate">Am I a good boy? The reason I
                           ask is because someone told me that people say this to all
                           dogs, even if they aren't good...</div>
                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                     </div>
                  </a> <a class="dropdown-item text-center small text-gray-500" href="#">Read
                     More Messages</a>
               </div></li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow"><a
               class="nav-link dropdown-toggle" href="#" id="userDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> </a> <!-- Dropdown - User Information -->
               <div
                  class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="userDropdown">
                  <a class="dropdown-item" href="#"> <i
                     class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
                  </a> <a class="dropdown-item" href="#"> <i
                     class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
                  </a> <a class="dropdown-item" href="#"> <i
                     class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity
                     Log
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#" data-toggle="modal"
                     data-target="#logoutModal"> <i
                     class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                     Logout
                  </a>
               </div></li>

         </ul>

         </nav>
         <!-- End of Topbar -->

         <!-- Begin Page Content -->
         <div class="container-fluid">

            <!-- Page Heading -->
            <div
               class="d-sm-flex align-items-center justify-content-between mb-4">
               <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

            </div>

            <!-- Content Row -->
            <div class="row">

               <!-- ====================================== 금일 방문자 수 ====================================== -->
               <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-primary shadow h-100 py-2">
                     <div class="card-body">
                        <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                              <div
                                 class="text-xs font-weight-bold text-primary text-uppercase mb-1">금일의
                                 방문자</div>
                              <div class="h5 mb-0 font-weight-bold text-gray-800"
                                 id=visitCount>${visitCount }</div>
                           </div>
                           <div class="col-auto">
                              <i class="fas fa-calendar fa-2x text-gray-300"></i>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- Earnings (Monthly) Card Example -->
               <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-success shadow h-100 py-2">
                     <div class="card-body">
                        <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                              <div
                                 class="text-xs font-weight-bold text-success text-uppercase mb-1">총
                                 기부액</div>
                              <div class="h5 mb-0 font-weight-bold text-gray-800"
                                 style="text-align: left">￦ ${donation }</div>
                           </div>
                           <div class="col-auto">
                              <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- Earnings (Monthly) Card Example -->
               <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-info shadow h-100 py-2">
                     <div class="card-body">
                        <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                              <div
                                 class="text-xs font-weight-bold text-info text-uppercase mb-1">맥도날드
                                 학습 프로그램 진행 총 횟수</div>
                              <div class="row no-gutters align-items-center">
                                 <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${studyCount }</div>
                                 </div>

                              </div>
                           </div>
                           <div class="col-auto">
                              <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- Pending Requests Card Example -->
               <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-warning shadow">
                     <div class="card-body">
                        <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                              <div
                                 class="text-xs font-weight-bold text-warning text-uppercase mb-1">유저관리</div>
                              <div class="h5 mb-0 font-weight-bold text-gray-800">
                                 <div class="input-group mt-3 mb-3">
                                    <input type="search" id=email class="form-control"
                                       placeholder="Email을 입력하세요" aria-label="Search">
                                    <div class="input-group-append">
                                       <button class="btn btn-outline-secondary" type="button"
                                          id="button-addon2">찾기</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-auto">
                              <i class="fas fa-comments fa-2x text-gray-300"></i>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <!-- Content Row -->

            <div class="row">

               <!-- Area Chart -->
               <div class="col-xl-8 col-lg-7">
                  <div class="card shadow mb-4">
                     <!-- Card Header - Dropdown -->
                     <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">최근 한달간 방문자 수</h6>
                        <div class="dropdown no-arrow">
                           <a class="dropdown-toggle" href="#" role="button"
                              id="dropdownMenuLink" data-toggle="dropdown"
                              aria-haspopup="true" aria-expanded="false"> <i
                              class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                           </a>
                           <div
                              class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                              aria-labelledby="dropdownMenuLink">
                              <div class="dropdown-header">Dropdown Header:</div>
                              <a class="dropdown-item" href="#">Action</a> <a
                                 class="dropdown-item" href="#">Another action</a>
                              <div class="dropdown-divider"></div>
                              <a class="dropdown-item" href="#">Something else here</a>
                           </div>
                        </div>
                     </div>
                     <!-- Card Body -->
                     <div class="card-body">
                        <div class="chart-area">
                           <canvas id="myAreaChart"></canvas>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- Pie Chart -->
               <div class="col-xl-4 col-lg-5">
                  <div class="card shadow mb-4">
                     <!-- Card Header - Dropdown -->
                     <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">성별 누적 통계</h6>
                        <div class="dropdown no-arrow">
                           <a class="dropdown-toggle" href="#" role="button"
                              id="dropdownMenuLink" data-toggle="dropdown"
                              aria-haspopup="true" aria-expanded="false"> <i
                              class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                           </a>
                           <div
                              class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                              aria-labelledby="dropdownMenuLink">
                              <div class="dropdown-header">Dropdown Header:</div>
                              <a class="dropdown-item" href="#">Action</a> <a
                                 class="dropdown-item" href="#">Another action</a>
                              <div class="dropdown-divider"></div>
                              <a class="dropdown-item" href="#">Something else here</a>
                           </div>
                        </div>
                     </div>
                     <!-- Card Body -->
                     <div class="card-body">
                        <div class="chart-pie pt-4 pb-2">
                           <canvas id="myPieChart"></canvas>
                        </div>
                        <div class="mt-4 text-center small">
                           <span class="mr-2"> <i
                              class="fas fa-circle text-success"></i> 남성
                           </span> <span class="mr-2"> <i
                              class="fas fa-circle text-warning"></i> 여성
                           </span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <!-- Content Row -->
            <div class="row">

               <!-- Content Column -->
               <div class="col-lg-6 mb-4">

                  <!-- Project Card Example -->
                  <div class="card shadow mb-4">
                     <div class="card-header py-3">

                        <h6 class="m-0 font-weight-bold text-primary">연령대별 회원 수</h6>

                     </div>
                     <div class="card-body">
                        <c:if test="${agedto.teenage > 0}">
                           <h4 class="small font-weight-bold">

                              10대 <span class="float-right">${agedto.teenage }명</span>

                           </h4>
                           <div class="progress mb-4">
                              <div class="progress-bar bg-warning" role="progressbar"
                                 style="width: ${agePerdto.perTeenage }%" aria-valuenow="40"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                        </c:if>
                        <c:if test="${agedto.twenty > 0}">
                           <h4 class="small font-weight-bold">

                              20대 <span class="float-right">${agedto.twenty }명</span>

                           </h4>
                           <div class="progress mb-4">
                              <div class="progress-bar bg-warning" role="progressbar"
                                 style="width: ${agePerdto.perTwenty }%" aria-valuenow="60"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                        </c:if>
                        <c:if test="${agedto.thirty > 0}">
                           <h4 class="small font-weight-bold">
                              30대 <span class="float-right">${agedto.thirty }명</span>

                           </h4>
                           <div class="progress mb-4">
                              <div class="progress-bar bg-primary" role="progressbar"
                                 style="width: ${agePerdto.perThirty }%" aria-valuenow="80"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                        </c:if>
                        <c:if test="${agedto.forty > 0}">
                           <h4 class="small font-weight-bold">
                              40대 <span class="float-right">${agedto.forty }명</span>
                           </h4>
                           <div class="progress">
                              <div class="progress-bar bg-success" role="progressbar"
                                 style="width: ${agePerdto.perForty }%" aria-valuenow="100"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                           <br>
                        </c:if>
                        <c:if test="${agedto.fifty > 0}">
                           <h4 class="small font-weight-bold">
                              50대 <span class="float-right">${agedto.fifty }명</span>

                           </h4>
                           <div class="progress mb-4">
                              <div class="progress-bar bg-info" role="progressbar"
                                 style="width: ${agePerdto.perFifty }%" aria-valuenow="20"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                        </c:if>
                        <c:if test="${agedto.sixty > 0}">
                           <h4 class="small font-weight-bold">
                              60대 <span class="float-right">${agedto.sixty }명</span>

                           </h4>
                           <div class="progress mb-4">
                              <div class="progress-bar bg-secondary" role="progressbar"
                                 style="width: ${agePerdto.perSixty }%" aria-valuenow="20"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                        </c:if>
                        <c:if test="${agedto.seventy > 0}">
                           <h4 class="small font-weight-bold">
                              70대 <span class="float-right">${agedto.seventy }명</span>
                           </h4>
                           <div class="progress mb-4">
                              <div class="progress-bar bg-danger" role="progressbar"
                                 style="width: ${agePerdto.perSeventy }%" aria-valuenow="20"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                        </c:if>
                        <c:if test="${agedto.eighty > 0}">
                           <h4 class="small font-weight-bold">
                              80대 <span class="float-right">${agedto.eighty }명</span>
                           </h4>
                           <div class="progress mb-4">
                              <div class="progress-bar bar80" role="progressbar"
                                 style="width: ${agePerdto.perEighty }%" aria-valuenow="20"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                        </c:if>
                        <c:if test="${agedto.ninety > 0}">
                           <h4 class="small font-weight-bold">
                              90대 <span class="float-right">${agedto.ninety }명</span>
                           </h4>
                           <div class="progress mb-4">
                              <div class="progress-bar bar90" role="progressbar"
                                 style="width: ${agePerdto.perNinety }%" aria-valuenow="20"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                           </div>
                        </c:if>
                     </div>
                  </div>

                  <!-- Color System -->
                  <div class="row">
                     <div class="col-lg-6 mb-4">
                        <div class="card bg-warning text-white shadow">
                           <div class="card-body">10~20대</div>
                        </div>
                     </div>
                     <div class="col-lg-6 mb-4">
                        <div class="card bg-primary text-white shadow">
                           <div class="card-body">30대</div>
                        </div>
                     </div>
                     <div class="col-lg-6 mb-4">
                        <div class="card bg-success text-white shadow">
                           <div class="card-body">40대</div>
                        </div>
                     </div>
                     <div class="col-lg-6 mb-4">
                        <div class="card bg-info text-white shadow">
                           <div class="card-body">50대</div>
                        </div>
                     </div>
                     <div class="col-lg-6 mb-4">
                        <div class="card bg-secondary text-white shadow">
                           <div class="card-body">60대</div>
                        </div>
                     </div>
                     <div class="col-lg-6 mb-4">
                        <div class="card bg-danger text-white shadow">
                           <div class="card-body">70대</div>
                        </div>
                     </div>
                     <div class="col-lg-6 mb-4">
                        <div class="card80 shadow text-white shadow">
                           <div class="card-body">80대</div>
                        </div>
                     </div>
                     <div class="col-lg-6 mb-4">
                        <div class="card90 text-white shadow">
                           <div class="card-body">90대</div>
                        </div>
                     </div>
                  </div>

               </div>

               <div class="col-lg-6 mb-4">

                  <!-- Approach (공지사항) -->
                  <div class="card shadow mb-4">
                     <div class="card-header py-3">
                        <div class="row boardTitle">
                           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                              <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                           </div>
                           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                              <a href="list.board03?noticeCurrentPage=1" class="moreBtn">더보기
                                 ></a>
                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="text">
                           <div class="row text-center">
                              <div
                                 class="col-lg-2 col-md-2 col-sm-2 col-xs-2 font-weight-bold d-none d-sm-block">글번호</div>
                              <div
                                 class="col-lg-4 col-md-8 col-sm-10 col-xs-10 font-weight-bold myTitle d-none d-sm-block">글제목</div>
                              <div
                                 class="col-lg-2 col-md-2 col-sm-4 col-xs-4 font-weight-bold d-none d-md-block">작성일</div>
                              <div
                                 class="col-lg-2 col-md-6 col-sm-4 col-xs-4 font-weight-bold d-none d-lg-block">작성자</div>
                              <div
                                 class="col-lg-2 col-md-6 col-sm-4 col-xs-4 font-weight-bold d-none d-lg-block">조회수</div>
                           </div>
                           <div class="row text-center">
                              <c:choose>
                                 <c:when test="${noticeRecordCount == 0 }">
                                    <div class="noneRecord col-lg-12 col-md-12 col-sm-12 mt-2">등록된
                                       게시물이 없습니다.</div>
                                 </c:when>
                                 <c:otherwise>
                                    <c:forEach var="list" items="${noticeList}">
                                       <div
                                          class="col-lg-2 col-md-2 col-sm-2 col-xs-2  d-none d-sm-block">${list.seq }</div>
                                       <div
                                          class="col-lg-4 col-md-8 col-sm-10 col-xs-10  myTitle d-none d-sm-block">
                                          <a
                                             href="noticeContent.board03?seq=${list.seq }&&commentPage=1">${list.title }</a>
                                       </div>
                                       <div
                                          class="col-lg-2 col-md-2 col-sm-4 col-xs-4  d-none d-md-block">${list.timeForm }</div>
                                       <div
                                          class="col-lg-2 col-md-6 col-sm-4 col-xs-4  d-none d-lg-block">${list.writer }</div>
                                       <div
                                          class="col-lg-2 col-md-6 col-sm-4 col-xs-4  d-none d-lg-block">${list.viewCount }</div>
                                    </c:forEach>
                                 </c:otherwise>
                              </c:choose>
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- Illustrations (질문 게시판)-->
                  <div class="card shadow mb-4">
                     <div class="card-header py-3">
                        <div class="row boardTitle">
                           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                              <h6 class="m-0 font-weight-bold text-primary">질문 게시판</h6>
                           </div>
                           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                              <a href="list.board02?qnaCurrentPage=1" class="moreBtn">더보기
                                 ></a>
                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="text">
                           <div class="row text-center">
                              <div
                                 class="col-lg-2 col-md-2 col-sm-2 col-xs-2 font-weight-bold d-none d-sm-block">글번호</div>
                              <div
                                 class="col-lg-4 col-md-8 col-sm-10 col-xs-10 font-weight-bold myTitle d-none d-sm-block">글제목</div>
                              <div
                                 class="col-lg-2 col-md-2 col-sm-4 col-xs-4 font-weight-bold d-none d-md-block">작성일</div>
                              <div
                                 class="col-lg-2 col-md-6 col-sm-4 col-xs-4 font-weight-bold d-none d-lg-block">작성자</div>
                              <div
                                 class="col-lg-2 col-md-6 col-sm-4 col-xs-4 font-weight-bold d-none d-lg-block">답변</div>
                           </div>
                           <div class="row text-center">
                              <c:choose>
                                 <c:when test="${qnaRecordCount == 0 }">
                                    <div class="noneRecord col-lg-12 col-md-12 col-sm-12 mt-2">등록된
                                       게시물이 없습니다.</div>
                                 </c:when>
                                 <c:otherwise>
                                    <c:forEach var="list" items="${qnaList}">
                                       <div
                                          class="col-lg-2 col-md-2 col-sm-2 col-xs-2 d-none d-sm-block">${list.seq }</div>
                                       <div
                                          class="col-lg-4 col-md-8 col-sm-10 col-xs-10  myTitle d-none d-sm-block">
                                          <a
                                             href="qnaContent.board02?seq=${list.seq }&&commentPage=1">${list.title }</a>
                                       </div>
                                       <div
                                          class="col-lg-2 col-md-2 col-sm-4 col-xs-4  d-none d-md-block">${list.timeForm }</div>
                                       <div
                                          class="col-lg-2 col-md-6 col-sm-4 col-xs-4  d-none d-lg-block">${list.writer }</div>
                                       <div
                                          class="col-lg-2 col-md-6 col-sm-4 col-xs-4  d-none d-lg-block answer ${list.seq }"
                                          seq="${list.seq }">${list.answer }</div>
                                    </c:forEach>
                                 </c:otherwise>
                              </c:choose>
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- Approach (자유 게시판) -->
                  <div class="card shadow mb-4">
                     <div class="card-header py-3">
                        <div class="row boardTitle">
                           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                              <h6 class="m-0 font-weight-bold text-primary">자유 게시판</h6>
                           </div>
                           <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                              <a href="list.board01?freeCurrentPage=1" class="moreBtn">더보기
                                 ></a>
                           </div>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="text">
                           <div class="row text-center">
                              <div
                                 class="col-lg-2 col-md-2 col-sm-2 col-xs-2 font-weight-bold d-none d-sm-block">글번호</div>
                              <div
                                 class="col-lg-4 col-md-8 col-sm-10 col-xs-10 font-weight-bold myTitle d-none d-sm-block">글제목</div>
                              <div
                                 class="col-lg-2 col-md-2 col-sm-4 col-xs-4 font-weight-bold d-none d-md-block">작성일</div>
                              <div
                                 class="col-lg-2 col-md-6 col-sm-4 col-xs-4 font-weight-bold d-none d-lg-block">작성자</div>
                              <div
                                 class="col-lg-2 col-md-6 col-sm-4 col-xs-4 font-weight-bold d-none d-lg-block">조회수</div>
                           </div>
                           <div class="row text-center">
                              <c:choose>
                                 <c:when test="${freeRecordCount == 0 }">
                                    <div class="noneRecord col-lg-12 col-md-12 col-sm-12 mt-2">등록된
                                       게시물이 없습니다.</div>
                                 </c:when>
                                 <c:otherwise>
                                    <c:forEach var="list" items="${freeList}">
                                       <div
                                          class="col-lg-2 col-md-2 col-sm-2 col-xs-2 d-none d-sm-block">${list.seq }</div>
                                       <div
                                          class="col-lg-4 col-md-8 col-sm-10 col-xs-10  myTitle d-none d-sm-block">
                                          <a
                                             href="freeContent.board01?seq=${list.seq }&&commentPage=1">${list.title }</a>
                                       </div>
                                       <div
                                          class="col-lg-2 col-md-2 col-sm-4 col-xs-4  d-none d-md-block">${list.timeForm }</div>
                                       <div
                                          class="col-lg-2 col-md-6 col-sm-4 col-xs-4  d-none d-lg-block">${list.writer }</div>
                                       <div
                                          class="col-lg-2 col-md-6 col-sm-4 col-xs-4  d-none d-lg-block">${list.viewCount }</div>
                                    </c:forEach>
                                 </c:otherwise>
                              </c:choose>
                           </div>
                        </div>
                     </div>
                  </div>

               </div>
            </div>
         </div>

          <!-- ============================= DB에 햄버거 메뉴 데이터 갱신 ===========================-->
         <button id="btn1">햄버거 메뉴 삽입</button>
         <p id="p1"></p>
         <button id="btn4">메뉴 삭제</button>
         <p id="p4"></p>
         <script>
                  document.getElementById("btn1").addEventListener("click", function(){
                     location.href="updateTableInsert.kiosk";
                  });
                  document.getElementById("btn4").addEventListener("click", function(){
                     location.href="updateTableNull.kiosk";
                  });
               </script>
         <!-- ===================================================================================== -->

         <!-- Scroll to Top Button-->
         <a class="scroll-to-top rounded" href="#page-top"> <i
            class="fas fa-angle-up"></i></a>

         <!-- Logout Modal-->
         <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">Ready to
                        Leave?</h5>
                     <button class="close" type="button" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                  </div>
                  <div class="modal-body">Select "Logout" below if you are
                     ready to end your current session.</div>
                  <div class="modal-footer">
                     <button class="btn btn-secondary" type="button"
                        data-dismiss="modal">Cancel</button>
                     <a class="btn btn-primary" href="login.html">Logout</a>
                  </div>
               </div>
            </div>
         </div>

         <!-- Bootstrap core JavaScript-->
         <script src="Resources/vendor/jquery/jquery.min.js"></script>
         <script src="Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

         <!-- Core plugin JavaScript-->
         <script src="Resources/vendor/jquery-easing/jquery.easing.min.js"></script>

         <!-- Custom scripts for all pages-->
         <script src="js/sb-admin-2.min.js"></script>

         <!-- Page level plugins -->
         <script src="Resources/vendor/chart.js/Chart.min.js"></script>

         <!-- Page level custom scripts -->
         <script>
                        Chart.defaults.global.defaultFontFamily = 'Nunito',
                            '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                        Chart.defaults.global.defaultFontColor = '#858796';

                        function number_format(number, decimals, dec_point, thousands_sep) {
                            // *     example: number_format(1234.56, 2, ',', ' ');
                            // *     return: '1 234,56'
                            number = (number + '').replace(',', '').replace(' ', '');
                            var n = !isFinite(+number) ? 0 : +number, prec = !isFinite(+decimals) ? 0
                            : Math.abs(decimals), sep = (typeof thousands_sep === 'undefined') ? ','
                            : thousands_sep, dec = (typeof dec_point === 'undefined') ? '.'
                            : dec_point, s = '', toFixedFix = function(n, prec) {
                                var k = Math.pow(10, prec);
                                return '' + Math.round(n * k) / k;
                            };
                            // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                            s = (prec ? toFixedFix(n, prec) : '' + Math.round(n))
                                .split('.');
                            if (s[0].length > 3) {
                                s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
                            }
                            if ((s[1] || '').length < prec) {
                                s[1] = s[1] || '';
                                s[1] += new Array(prec - s[1].length + 1).join('0');
                            }
                            return s.join(dec);
                        }

                        // =============================  차트_그래프 (myAreaChart)  =============================
                        var ctx = document.getElementById("myAreaChart");
                        var myLineChart = new Chart(
                            ctx,
                            {                                  
                                type : 'line',
                                data : {
                                    labels : [    
                                        <c:forEach var="temp" items="${vList }">
                                        "${temp.visitDate }",
                        </c:forEach>   
                                    ],
                                    datasets : [ {
                                        label : "Earnings",
                                        lineTension : 0.3,
                                        backgroundColor : "rgba(78, 115, 223, 0.05)",
                                        borderColor : "rgba(78, 115, 223, 1)",
                                        pointRadius : 3,
                                        pointBackgroundColor : "rgba(78, 115, 223, 1)",
                                        pointBorderColor : "rgba(78, 115, 223, 1)",
                                        pointHoverRadius : 3,
                                        pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
                                        pointHoverBorderColor : "rgba(78, 115, 223, 1)",
                                        pointHitRadius : 10,
                                        pointBorderWidth : 2,
                                        data : [
                                            <c:forEach var="temp" items="${vList }">
                                            ${temp.visitCount },
                        </c:forEach>
                                        ],
                                    } ],
                                },
                                options : {
                                    maintainAspectRatio : false,
                                    layout : {
                                        padding : {
                                            left : 10,
                                            right : 25,
                                            top : 25,
                                            bottom : 0
                                        }
                                    },
                                    scales : {
                                        xAxes : [ {
                                            time : {
                                                unit : 'date'
                                            },
                                            gridLines : {
                                                display : false,
                                                drawBorder : false
                                            },
                                            ticks : {
                                                maxTicksLimit : 7
                                            }
                                        } ],
                                        yAxes : [ {
                                            ticks : {
                                                maxTicksLimit : 5,
                                                padding : 10,
                                                // Include a dollar sign in the ticks
                                                callback : function(value, index,
                                                                     values) {
                                                    return number_format(value) + '명';
                                                }
                                            },
                                            gridLines : {
                                                color : "rgb(234, 236, 244)",
                                                zeroLineColor : "rgb(234, 236, 244)",
                                                drawBorder : false,
                                                borderDash : [ 2 ],
                                                zeroLineBorderDash : [ 2 ]
                                            }
                                        } ],
                                    },
                                    legend : {
                                        display : false
                                    },
                                    tooltips : {
                                        backgroundColor : "rgb(255,255,255)",
                                        bodyFontColor : "#858796",
                                        titleMarginBottom : 10,
                                        titleFontColor : '#6e707e',
                                        titleFontSize : 14,
                                        borderColor : '#dddfeb',
                                        borderWidth : 1,
                                        xPadding : 15,
                                        yPadding : 15,
                                        displayColors : false,
                                        intersect : false,
                                        mode : 'index',
                                        caretPadding : 10,
                                        callbacks : {
                                            label : function(tooltipItem, chart) {
                                                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label
                                                || '';
                                                return "방문자 수 : "
                                                    + number_format(tooltipItem.yLabel) + '명';
                                            }
                                        }
                                    }
                                }
                            });

                        // Set new default font family and font color to mimic Bootstrap's default styling
                        Chart.defaults.global.defaultFontFamily = 'Nunito',
                            '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                        Chart.defaults.global.defaultFontColor = '#858796';

                        // =============================  차트_도넛 (myPieChart)  =============================
                        var ctx = document.getElementById("myPieChart");
                        var myPieChart = new Chart(ctx, {
                            type : 'doughnut',
                            data : {
                                labels : [ "여성" , "남성" ],
                                datasets : [ {
                                    data : [ ${vdto.female},  ${vdto.male}],
                                    backgroundColor : ['#f6c23e' , '#1cc88a' ],
                                    hoverBackgroundColor : ['blue' , 'red'],
                                    hoverBorderColor : "rgba(234, 236, 244, 1)",
                                } ],
                            },
                            options : {
                                maintainAspectRatio : false,
                                tooltips : {
                                    backgroundColor : "rgb(255,255,255)",
                                    bodyFontColor : "#858796",
                                    borderColor : '#dddfeb',
                                    borderWidth : 2,
                                    xPadding : 15,
                                    yPadding : 15,
                                    displayColors : false,
                                    caretPadding : 10,
                                },
                                legend : {
                                    display : false
                                },
                                cutoutPercentage : 80,
                            },
                        });

                        $(".answer").each(function(i,item){
                            var seq = $(this).attr('seq');
                            var answer = "." + seq;
                            if($(answer).html() == 'N'){
                                $(answer).css('color','red');
                            }else{$(answer).css('color','blue');}
                        });
                    </script>
</body>
</html>