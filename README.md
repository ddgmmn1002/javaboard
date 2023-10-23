# 1. 프로젝트 소개

**영화 정보 커뮤니티**

다양한 영화, 드라마 컨텐츠를 소개하고 리뷰를 확인할 수 있는 커뮤니티입니다.

<img src="https://github.com/ddgmmn1002/movie/assets/33245033/b655170e-fb59-42d2-9ec7-42b1118bedc3">
</img>

# 2. 기술 스택

- JSP
- Servlet
- Tomcat 9
- jQuery

**Style**
- Bootstrap 5

**Database**
- MariaDB

**API**
- TinyMCE (WYSIWYG editor)
- Youtube (video player)

# 3. 기능

### 회원가입과 로그인, 로그아웃
- 회원가입을 통해 신규 회원 등록이 가능하며 ID와 비밀번호로 로그인할 수 있습니다.
- 비회원 이용자는 게시물, 컨텐츠 정보 열람 외의 기능이 제한되며, 회원 이용자에게 마이페이지 메뉴가 제공됩니다.

<회원가입 페이지>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/c2cfb31a-e2b8-4ac1-aed3-76fe63715bc1" />

<모달로 구성된 로그인 창>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/838d1a93-5fc0-4a10-aaf2-ef32fda48f42" />
AJAX로 페이지 이동 없이 로그인을 처리합니다.

<로그인 성공>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/5c84e5c6-f995-4e61-a9ae-f5d5feba2d4e" />
로그인 성공 시, 상단 메뉴 바에 마이페이지가 메뉴 생성됩니다.

<마이페이지의 내 활동과 회원정보 수정 페이지>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/5a5f3632-3f6e-4479-9a18-3bc5f0a2899c" />
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/a1fabc6c-1d33-4397-926f-089bd3bb89df" />


### 게시글 작성, 수정, 삭제
- 로그인한 회원은 게시글 작성이 가능합니다.
- 자신의 게시글에 한해 수정과 삭제가 가능합니다.

<게시글 목록>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/b6f66ca8-6e92-411b-b117-a73ee732b8b9" />

<새 글 작성 페이지>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/c60daee9-2065-4c2b-97bf-d0004b75c5b9" />
TextEditor에서 제공하는 다양한 추가 기능을 이용하여 글을 작성할 수 있습니다.

<글 수정, 삭제>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/b998cfe9-d516-4709-9afb-a003160722ef" />
작성이 완료된 게시글 페이지에서 수정, 삭제를 할 수 있습니다.


### 댓글 작성, 수정, 삭제
- 로그인한 회원은 게시글에 댓글 작성이 가능합니다.
- 자신의 댓글에 한해 수정과 삭제가 가능합니다.
- 게시글 작성자가 댓글을 작성할 경우, 작성자 표시가 붙습니다.

<댓글 작성>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/774c18fa-24c1-4118-bfe4-f0aedf7e78e0" />
TextEditor로 댓글을 작성할 수 있습니다.

<댓글 수정, 삭제>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/f0f57f68-7239-4ec7-8fe3-25788126276a" />
AJAX로 페이지 이동 없이 댓글을 수정할 수 있습니다.


### 좋아요와 싫어요
- 로그인한 회원은 게시글에 좋아요와 싫어요를 남길 수 있습니다.
- 게시글마다 좋아요 수와 싫어요 수가 표시됩니다.
- 좋아요와 싫어요 버튼을 한번 더 누르면 취소할 수 있습니다.

<img src="https://github.com/ddgmmn1002/movie/assets/33245033/8f602e69-1b96-4fa6-a05c-87fb7136aab7" />


### 평론글 작성
- 평론가 회원은 평론글을 작성할 수 있습니다.
- 시스템에 등록되어 있는 컨텐츠를 선택하여 게시글에 해당 컨텐츠의 정보를 추가할 수 있습니다.

<평론글 작성 페이지>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/114967e8-57ce-4356-9d2e-325959db08b0" />
글 작성 페이지에서 컨텐츠를 선택할 수 있습니다.

<img src="https://github.com/ddgmmn1002/movie/assets/33245033/64748d49-6e46-4fad-8432-6aeabebc490e" />

선택한 컨텐츠의 각 정보들과 포스터, 예고편이 추가됩니다.


### 관리자 모드
- 관리자 ID로 로그인 시 관리자 메뉴가 활성화 됩니다.
- 관리자는 새 컨텐츠 정보를 등록할 수 있습니다.
- 관리자는 회원들의 정보를 관리하고 회원 차단과 같은 기능을 이용할 수 있습니다.

<상단 메뉴에 활성화된 관리자 메뉴>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/7cfc23ac-405f-4e3c-b876-ca1c64c468ef" />

<img src="https://github.com/ddgmmn1002/movie/assets/33245033/f2bc7daa-967f-40b1-9f93-a6bb86034388" />

제목, 출연진 등의 정보를 입력해 컨텐츠를 등록할 수 있습니다.


<회원 관리>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/72617f49-d229-44b0-baa6-90dcff223e11" />
회원 목록에서 회원들의 상세 정보를 확인하고 수정할 수 있습니다.

<회원 차단>
<img src="https://github.com/ddgmmn1002/movie/assets/33245033/4f095cb7-705d-408c-ac3c-b49f47bda39e" />
회원 관리 페이지에서 차단된 회원의 게시글은 볼 수 없는 상태가 됩니다.
