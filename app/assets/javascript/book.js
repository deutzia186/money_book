// タブの操作
document.addEventListener('DOMContentLoaded', function(){
	const tabs = document.getElementsByClassName('tab');
	for(let i = 0; i < tabs.length; i++) {
		tabs[i].addEventListener('click', tabSwitch);
  }
  
	function tabSwitch(){
		document.getElementsByClassName('is-active')[0].classList.remove('is-active');
		this.classList.add('is-active');
		document.getElementsByClassName('is-show')[0].classList.remove('is-show');
		const arrayTabs = Array.prototype.slice.call(tabs);
		const index = arrayTabs.indexOf(this);
		document.getElementsByClassName('panel')[index].classList.add('is-show');
	};
});

// 支出ダブのアクション
$(function(){
  $fileField = $('#file-expense')
   $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field-expense");
 
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
					width: "100%",
					height:"100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

// 収入タブのアクション
$(function(){
  $fileField = $('#file-income')
   $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field-income");
 
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
					width: "100%",
					height:"100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});