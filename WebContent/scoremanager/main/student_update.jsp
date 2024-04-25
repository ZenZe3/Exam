<%-- 学生登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<section class="me-4">
			<h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">学生情報変更</h2>
			<%-- パラメーターdoneが存在する場合 --%>
			<c:if test="${!empty done}">
				<div class="bg-success bg-opacity-50 text-center lh-lg">
					<p>${done}</p>
				</div>
			</c:if>
			<form action = "StudentUpdateExecute.action" method="post">
				<div class="mx-3 py-2">
					<div class="mb-3">
						<label class="form-label" for="student-ent_year-select">入学年度</label>
						<input class="form-control" type="text" id="student-no-input" name="ent_year"
							maxlength="10" value="${ent_year}" readonly />
						<div class="mt-2 text-warning">${errors.get("ent_year")}</div>
					</div>
					<div class="my-3">
						<label class="form-label" for="student-no-input">学生番号</label>
						<input class="form-control" type="text" id="student-no-input" name="no"
							maxlength="10" value="${no}" readonly />
						<div class="mt-2 text-warning">${errors.get("no")}</div>
					</div>
					<div class="my-3">
						<label class="form-label" for="student-name-input">氏名</label>
						<input class="form-control" type="text" id="student-name-input"
							name="name" placeholder="氏名を入力してください" maxlength="10"
							value="${name}" required />
						<div class="mt-2 text-warning">${errors.get("name")}</div>
					</div>

					<div class="my-3">
						<label class="form-label" for="student-class_num-select">クラス</label>
						<select class="form-select" id="student-class_num-select" name="class_num">
							<c:forEach var="num" items="${class_num_set}">
								<%-- 現在のnumと選択されていたclass_numが一致していた場合selectedを追記 --%>
								<option value="${num}" <c:if test="${num==class_num}">selected</c:if>>${num}</option>
							</c:forEach>
						</select>
					</div>

					<label class="form-check-label">在学中
					<input class="form-check-input" type="checkbox" name="si_attend" value="t"
					<c:if test="${isattend_set==true}">checked</c:if>></label>

					<div class="mt-3">
					<!--
						<input class="btn btn-primary" type="submit" value="登録して再度入力" name="continue">
					 -->
						<input class="btn btn-secondary" type="submit" value="登録して終了" name="end">
					</div>
				</div>
			</form>
			<div class="lh-lg row">
				<div class="mx-3 col-1">
					<a href="StudentList.action">戻る</a>
				</div>
			</div>
		</section>
	</c:param>
</c:import>
