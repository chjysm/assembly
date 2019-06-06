<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js consumer" lang="en">
  <head>
    <script>
        (function(e, p){
            var m = location.href.match(/platform=(win8|win|mac|linux|cros)/);
            e.id = (m && m[1]) ||
           (p.indexOf('Windows NT 6.2') > -1 ? 'win8' : p.indexOf('Windows') > -1 ? 'win' : p.indexOf('Mac') > -1 ? 'mac' : p.indexOf('CrOS') > -1 ? 'cros' : 'linux');
            e.className = e.className.replace(/\bno-js\b/,'js');
        })(document.documentElement, window.navigator.userAgent)
    </script>
    <meta charset="utf-8">
    <meta content="initial-scale=1, minimum-scale=1, width=device-width" name="viewport">
    <meta content=
    "Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
    name="description">
        <title>
          주변매장검색
        </title>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.js"></script>
    <link href="https://plus.google.com/100585555255542998765" rel="publisher">
    <script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Audiowide|Nanum+Myeongjo|Orbitron:700|Orbitron|Song+Myung|Syncopate|Nanum+Gothic');
        *{margin:0px auto; text-align: center; text-decoration: none; color:#000;}
        body{margin-top:50px;}
        #info {font-size: 20px;}
        h1{margin-bottom: 50px; font-family: Orbitron;}
        p{font-family: Nanum Gothic;}
        #div_start {float: right;}
        #headline {text-decoration: none;}
        #results {font-size: 14px; font-weight: bold; border: 1px solid #ddd; padding: 15px; text-align: left; height: 50px; overflow-y: auto; max-width:800px; margin:50px auto; box-shadow:0 5px 10px -5px #333; width:90%}
        #start_button {border: 0; background-color:transparent; padding: 0; cursor:pointer;}
            #start_button>img{width:40px; height:40px; }
            #start_button:focus{outline:none;}
        .interim {color: gray;}
        .final {color: black; padding-right: 3px;width:80%;height:100%;}
        .button {display: none;}
        .marquee {margin: 20px auto;}
        .bounceIn {-webkit-animation-duration: 0.75s; animation-duration: 0.75s; -webkit-animation-name: bounceIn; animation-name: bounceIn; animation-duration: 3s; animation-iteration-count: infinite;}
        .select_lang{width:190px; height:35px; font-size: 16px;}
        #copy_button{width:200px; height:40px; background: #fff; /*linear-gradient(-90deg, #FE9A2E, #FFBF00); */ border:none; border-radius: 5px; margin-bottom: 20px; font-size: 16px; font-weight: bold; font-family: Nanum Gothic; box-shadow:1px 2px 9px 5px #999; cursor:pointer;}
        #append{border: 1px solid #ddd; padding: 15px; text-align: left; height: 300px; overflow-y: auto; max-width:800px; margin:50px auto; text-align: left;}
        #btn{float:right; margin-right:10px;  cursor:pointer;}
        textarea{display: none;}
        #final_span{font-size: 18px; font-weight: bold;}
         #nextBtn{font-size: 18px; font-weight: bold;}
         #addr{font-size: 18px; font-weight: bold;}
         .container{
        	padding-left:10px;
            padding-top: 20px ;
            padding-right:40px;
            padding-bottom:20px;
            margin-top:30px;
            margin-left: 20px;
            margin-right: 20px;
            margin-bottom: 20px;
            border:1px solid;
            border-radius: 10px;
            border-color: #007bff;
            text-align: center;
            align-content: center;
            background-color: #007bff11;
		}
    </style>
        <style>
            a.c1 {font-weight: normal;}
        </style>
  </head>
  <body class="" id="grid">
    <div class="browser-landing" id="main">
    <div class="compact marquee-stacked" id="marquee">
        <div class="marquee-copy">
          <h1>
            <a class="c1" href="http://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html"></a> 주변 매장 찾기
          </h1>
        </div>
      </div>
      <div class="compact marquee container">
        <div id="info">
          <p id="info_start">
           말하기 전에 REC 아이콘을 눌러주세요
          </p>
          <p id="info_speak_now" style="display:none">
           지금 말씀하세요!
          </p>
        </div>
        
        <input type="text" value="${addr}" class="final mt-2" id="addr" contenteditable="true" name="addr" readonly> 
        <div id="results">
        <div id="div_start">
              <button id="start_button" onclick="startButton(event)">
                  <img class="" alt="Start" id="start_img" src="https://image.flaticon.com/icons/png/512/440/440815.png">
              </button>
            </div>
          <input type="text" placeholder="찾고 싶으신 브랜드의 이름을 말씀하시거나 입력해주세요! 주변 역이름을 입력하면 더 정확해 집니다!  " class="final" id="final_span" contenteditable="true" name="brand"> <span class="interim" id=
          "interim_span"></span>
        </div>
        <input type="button" class="btn btn-primary" value ="입력완료" id="nextBtn">
        
      </div>
    <script>
      window.___gcfg = { lang: 'en' };
      (function() {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/plusone.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
      })();
      $(function(){
     	 $("#nextBtn").on("click",function(){
     		 if($("#final_span").val()!=""){
     			location.href="goStoreSerch3.win?addr=${addr}&brand="+$("#final_span").val(); 
     		 }else{
     			 alert("브랜드 명을 입력 하세요!");
     		 }
     	 });
       });
    </script> 
    <script>
// If you modify this array, also update default language / dialect below.
    // Set default language / dialect.
    showInfo('info_start');
    var create_email = false;
    var final_transcript = '';
    var recognizing = false;
    var ignore_onend;
    var start_timestamp;
    if (!('webkitSpeechRecognition' in window)) {
      upgrade();
    } else {
      start_button.style.display = 'inline-block';
      var recognition = new webkitSpeechRecognition();
      recognition.continuous = true;
      recognition.interimResults = true;

      recognition.onstart = function() {
        recognizing = true;
        showInfo('info_speak_now');
        start_img.src = 'https://yt3.ggpht.com/a/AGF-l78z9oO9eD3eupnCRad7KockzUVmw3yGrAqI6g=s900-mo-c-c0xffffffff-rj-k-no';
        start_img.setAttribute('class', 'bounceIn');
      };

      recognition.onend = function() {
        recognizing = false;
        if (ignore_onend) {
          return;
        }
        start_img.src = 'https://image.flaticon.com/icons/png/512/440/440815.png';
            start_img.setAttribute('class', '');
        if (!final_transcript) {
          showInfo('info_start');
          return;
        }
        showInfo('info_start');
        if (window.getSelection) {
          window.getSelection().removeAllRanges();
          var range = document.createRange();
          range.selectNode(document.getElementById('final_span'));
          window.getSelection().addRange(range);
        }
        if (create_email) {
          create_email = false;
          createEmail();
        }
      };

      recognition.onresult = function(event) {
        var interim_transcript = '';
        if (typeof(event.results) == 'undefined') {
          recognition.onend = null;
          recognition.stop();
          upgrade();
          return;
        }
        for (var i = event.resultIndex; i < event.results.length; ++i) {
          if (event.results[i].isFinal) {
            final_transcript += event.results[i][0].transcript;
          } else {
            interim_transcript += event.results[i][0].transcript;
          }
        }
        final_transcript = capitalize(final_transcript);
        final_span.value = linebreak(final_transcript);
        interim_span.innerHTML = linebreak(interim_transcript);
      };
    }

    function upgrade() {
      start_button.style.visibility = 'hidden';
      showInfo('info_upgrade');
    }

    var two_line = /\n\n/g;
    var one_line = /\n/g;
    function linebreak(s) {
      return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
    }

    var first_char = /\S/;
    function capitalize(s) {
      return s.replace(first_char, function(m) { return m.toUpperCase(); });
    }

//     function createEmail() {
//       var n = final_transcript.indexOf('\n');
//       if (n < 0 || n >= 80) {
//         n = 40 + final_transcript.substring(40).indexOf(' ');
//       }
//       var subject = encodeURI(final_transcript.substring(0, n));
//       var body = encodeURI(final_transcript.substring(n + 1));
//       window.location.href = 'mailto:?subject=' + subject + '&body=' + body;
//     }
    function startButton(event) {
      if (recognizing) {
        recognition.stop();
        return;
      }
      final_transcript = '';
      recognition.lang = ['ko-KR'];
      recognition.start();
      ignore_onend = false;
      final_span.value = '';
      interim_span.innerHTML = '';
      start_img.src = '/intl/en/chrome/assets/common/images/content/mic-slash.gif';
      showInfo('info_allow');
      start_timestamp = event.timeStamp;
    }
    function showInfo(s) {
      if (s) {
        for (var child = info.firstChild; child; child = child.nextSibling) {
          if (child.style) {
            child.style.display = child.id == s ? 'inline' : 'none';
          }
        }
        info.style.visibility = 'visible';
      } else {
        info.style.visibility = 'hidden';
      }
    }     
    </script>
    </div>
  </body>
</html>