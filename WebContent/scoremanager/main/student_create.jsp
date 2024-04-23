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
			<h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">学生情報登録</h2>
			<form method="get">
					<div class="col-4">
						<label class="form-label" for="student-f1-select">入学年度</label>
						<select class="form-select" id="student-f1-select" name="f1">
							<option value="0">--------</option>
							<c:forEach var="year" items="${ent_year_set}">
								<%-- --%>
								<option value="${year}" <c:if test="year=={f1}">selected</c:if>>${year}</option>
							</c:forEach>
						</select>
					</div>

					<p></p>
					<div class="col-4">
						<label class="form-label" for="student-f1-select">学生番号</label>
						<p><input class="form-label" id="student-f1-select" name="f1"></p>
						<%-- 学生番号を入力してください --%>
							<c:forEach var="year" items="${ent_year_set}">
								<option value="${year}" <c:if test="year=={f1}">selected</c:if>>${year}</option>
							</c:forEach>
					</div>

					<div class="col-4">
						<label class="form-label" for="student-f1-select">氏名</label>
						<p><input class="form-label" id="student-f1-select" name="f1"></p>
						<%-- 氏名を入力してください --%>
							<c:forEach var="year" items="${ent_year_set}">
								<option value="${year}" <c:if test="year=={f1}">selected</c:if>>${year}</option>
							</c:forEach>
					</div>

					<p></p>
					<div class="col-4">
						<label class="form-label" for="student-f1-select">クラス</label>
						<select class="form-select" id="student-f1-select" name="f1">
							<option value="0"></option>
							<c:forEach var="year" items="${ent_year_set}">
								<option value="${year}" <c:if test="year=={f1}">selected</c:if>>${year}</option>
							</c:forEach>
						</select>
					</div>

					<p></p>
					<div class="col-2 text-center">
						<button class="btn btn-secondary" id="filter-button">登録して終了</button>
					</div>

					<p></p>
					<div class="my-2 text-end px-4">
						<a href="StudentCreate.action" style="text-align:left">戻る</a>
					</div>
			</form>
		</section>
	</c:param>
</c:import>
