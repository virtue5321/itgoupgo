// 사이드바 메뉴 클릭 시 active 이동
const navItems = document.querySelectorAll(".nav-item");
const pageTitle = document.getElementById("pageTitle");

navItems.forEach(item => {
  item.addEventListener("click", () => {
    navItems.forEach(i => i.classList.remove("active"));
    item.classList.add("active");
    pageTitle.textContent = item.textContent; // 페이지 제목 변경
  });
});

// 숫자 카운트 애니메이션
const counters = document.querySelectorAll(".count");
counters.forEach(counter => {
  const target = +counter.getAttribute("data-target");
  let count = 0;

  const update = () => {
    const increment = target / 60; // 약 1초 정도에 도달
    if (count < target) {
      count += increment;
      counter.textContent = Math.floor(count);
      requestAnimationFrame(update);
    } else {
      counter.textContent = target;
    }
  };
  update();
});

// 다크 모드 토글
const toggleMode = document.getElementById("toggleMode");
toggleMode.addEventListener("click", () => {
  document.body.classList.toggle("dark");
  toggleMode.textContent =
    document.body.classList.contains("dark") ? "☀️ 라이트 모드" : "🌙 다크 모드";
});

// 모바일 메뉴 토글
const menuBtn = document.getElementById("menuBtn");
const sidebar = document.getElementById("sidebar");
menuBtn.addEventListener("click", () => {
  sidebar.classList.toggle("show");
});
