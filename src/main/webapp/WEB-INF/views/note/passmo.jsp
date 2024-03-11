<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 비밀번호 모달 팝업 -->
								<div class="modal fade" id="noteModal" tabindex="-1"
									aria-labelledby="noteModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="noteModalLabel">비밀번호 업데이트</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<form action="./PasswordUpdate" method="post"
													class="form-inline">
													<div class="form-group">
														<input type="password" name="newPassword"
															class="form-control" id="inputPassword"
															placeholder="새로운 비밀번호 입력" required>
													</div>
													<br>
													<button type="submit" class="btn btn-primary">비밀번호
														업데이트</button>
												</form>
											</div>
										</div>
									</div>
								</div>


</body>
</html>