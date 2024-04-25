package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Student;
import bean.Teacher;
import dao.StudentDao;
import tool.Action;

public class StudentUpdateExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		//HttpSession session = req.getSession();//セッション
		StudentDao sDao = new StudentDao();//学生Dao
		int entYear;//入学年度
		String no = "";//学生番号
		String name = "";//氏名
		String classNum = "";//クラス番号
		String isAttendStr = "";
		Boolean isAttend=false;
		Student student = null;//学生
		//Teacher teacher = (Teacher) session.getAttribute("user");// ログインユーザーを取得

		//リクエストパラメータ―の取得 2
		entYear = Integer.parseInt(req.getParameter("ent_year"));//入学年度
		no = req.getParameter("no");//学生番号
		name = req.getParameter("name");//氏名
		classNum = req.getParameter("class_num");//クラス番号
		isAttendStr = req.getParameter("si_attend");

		System.out.println(isAttendStr);

		if (isAttendStr != null){
			isAttend = true;
		}
		School school = new School();
		school.setCd("oom");//学校コードをセットする
		school.setName("テスト校");//学校名をセットする

		Teacher teacher = new Teacher();
		teacher.setId("admin1");//講師IDをセット
		teacher.setName("管理者１");//講師名をセット
		teacher.setPassword("password");//ログインパスワードをセット
		teacher.setSchool(school);//学校オブジェクトをセット

		//DBからデータ取得 3

		//ビジネスロジック 4
		//DBへデータ保存 5
		//条件で手順4~5の内容が分岐

		student = new Student();
		// インスタンスに値をセット
		student.setNo(no);
		student.setName(name);
		student.setEntYear(entYear);
		student.setClassNum(classNum);
		student.setAttend(isAttend);
		student.setSchool(school);
		//student.setSchool(((Teacher)session.getAttribute("user")).getSchool());
		// 学生を保存
		sDao.save(student);

		//エラーがあったかどうかで手順6~7の内容が分岐
		//レスポンス値をセット 6
		//JSPへフォワード 7

		req.getRequestDispatcher("student_update_done.jsp").forward(req, res);
	}
}
