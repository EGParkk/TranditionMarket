(function () {
  $('#table').DataTable({
    language: {
      lengthMenu: '    _MENU_',
      search: '검색',
      paginate: { previous: '<', next: '>' },
      info: '페이지 _PAGE_ / _PAGES_',
      infoEmpty: '데이터가 없습니다.',
      infoFiltered: '(전체 페이지 _MAX_ 에서 검색)',
      thousands: ',',
    },
    lengthMenu: [5, 10, 25], //한페이지 표시할 줄수
    pageLength: 5, //페이지의 갯수
    ordering: true, //열의 정렬기능(삭제)
    columnDefs: [
      { orderable: false, targets: 1 },
      { orderable: false, targets: 2 },
      { orderable: false, targets: 3 },
      { orderable: false, targets: 4 },
      { orderable: false, targets: 5 },
      { searchable: false, tagets: 0 },
      { searchable: false, tagets: 3 },
      { searchable: false, tagets: 4 },
      { searchable: false, tagets: 5 }, // 인덱스 정렬만 빼고 정렬 옵션 끄기
    ],
    dom:
      "<'col-sm-12 col-md-6'l><'col-sm-12 col-md-12'f><'col-sm-12 mt-5 pt-5'tr><'col-sm-12 col-md-5'i><'col-sm-12 col-md-7 mt-5 pt-5'p>" +
      "<'clear'>",
    search: {
      return: true,
      smart: true,
    },
    order: [0, 'ASC'], // 맨 처음 열 정렬 ASC
    stateSave: false,
  });
  let table = $('#table').DataTable();
  table.state.clear(); // 데이터 테이블 초기화
})();

// const rows = document.querySelector('#table tbody');
// let data = null;
// rows.addEventListener('click', function (e) {
//   let table = new DataTable('#table');
//   let data = table.row(e.target).data();
//   console.log(data);
//   localStorage.setItem('data', JSON.stringify(data));
//   location.href = 'Boards?bno=' + data[0] + '&actiont=' + data[1] + '&check=' + data[6] + '&action=view';
// });
// console.log(data[0]);
// location.href =
// '<%=request.getContextPath() %>' + '/Boards?action=view&bno=' + data[0] + '&actiont=' + data[1] + '&check=' + data[6];
