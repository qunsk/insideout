<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="modal fade" id="wnoteModal" tabindex="-1"
									aria-labelledby="noteModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="noteModalLabel">쪽지 보내기</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<form class="note-form" id="snote" method="post"
													action="sendnote">
													<div class="mb-3">
														<label for="recv_id" class="form-label">받는 사람:</label> <input
															type="text" class="form-control" id="recv_id"
															name="recv_id">
													</div>
													<div class="mb-3">
														<label for="message" class="form-label">쪽지 내용:</label>
														<textarea class="form-control" id="message" name="message"
															required></textarea>
													</div>
													<button class="btn btn-lg btn-primary btn-sm" type="submit"
														id="sendmsg">보내기</button>

												</form>
											</div>
										</div>
									</div>
								</div>

</body>
</html>