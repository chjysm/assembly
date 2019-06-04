var deviceSlider = $('.js-device-slider'),
    deviceSliderList = $('.js-device-slider-list'),
    deviceSliderItem = deviceSliderList.find("li"),
    slideCount = deviceSliderItem.length,
//    slideWidth = deviceSliderItem.width(),
    slideHeight = deviceSliderItem.height(),
    sliderUlHeight = slideCount * slideHeight,
    sliderUpBtn = $('.js-device-slider-up'),
    sliderDownBtn = $('.js-device-slider-down');

//deviceSlider.css({ width: slideWidth, height: slideHeight * 3 });

function checkItem() {
  if ($(".device-slider__item.selected").index() <= 0) {
    sliderDownBtn.show();
    sliderUpBtn.hide();
  } 
  else if ($(".device-slider__item.selected").index() >= deviceSliderItem.length - 3) {
    sliderDownBtn.hide();
    sliderUpBtn.show();
  }  
  else {
    sliderDownBtn.show();
    sliderUpBtn.show();
  }
};

function moveUp() {
  var topCss = +deviceSliderList.css("top").replace(/px/g, '');
  deviceSliderList.animate({
    top: topCss + slideHeight
  }, 200, function () {
    $(".device-slider__item.selected").removeClass("selected").prev().addClass("selected");
    checkItem();
  });
};

function moveDown() {
  var topCss = +deviceSliderList.css("top").replace(/px/g, '');
  deviceSliderList.animate({
    top: topCss - slideHeight
  }, 200, function () {
    $(".device-slider__item.selected").removeClass("selected").next().addClass("selected");
    checkItem();
  });
};

sliderUpBtn.click(function () {
  $(this).attr("disabled", "disabled");
  moveUp();
  setTimeout(function(){
    $(".js-device-slider-up").removeAttr("disabled");
  }, 200);
});

sliderDownBtn.click(function () {
  $(this).attr("disabled", "disabled");
  moveDown();
  setTimeout(function(){
    $(".js-device-slider-down").removeAttr("disabled");
  }, 200);
});


checkItem();


//show large image on hover
function showImg(item) {
  var src = item.find("img").attr("src"),
      mainImg = $(".device-media-container img");

  mainImg.attr("src", src);

  $(".device-slider__item").removeClass("active")
  item.addClass("active");
};

$(".device-slider__item").mouseover(function(){
  showImg($(this));
});


//FOR LOOP SLIDER
// deviceSliderList.css({ marginTop: - slideHeight });
        
// $('.js-device-slider-list li:last-child').prependTo('.js-device-slider-list');

// function moveUp() {
//   deviceSliderList.animate({
//     top: + slideHeight
//   }, 200, function () {
//     $('.js-device-slider-list li:last-child').prependTo('.js-device-slider-list');
//     deviceSliderList.css('top', '');
//   });
// };

// function moveDown() {
//   deviceSliderList.animate({
//     top: - slideHeight
//   }, 200, function () {
//     $('.js-device-slider-list li:first-child').appendTo('.js-device-slider-list');
//     deviceSliderList.css('top', '');
//   });
// };