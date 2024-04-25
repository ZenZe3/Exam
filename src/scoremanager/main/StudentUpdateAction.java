package scoremanager.main;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Student;
import bean.Teacher;
import dao.ClassNumDao;
import dao.StudentDao;
import tool.Action;

public class StudentUpdateAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//ローカル変数の宣言 1
		//HttpSession session = req.getSession();//セッション
		StudentDao sDao = new StudentDao();//学生Dao
		int entYear;//入学年度
		String no = "";//学生番号
		String name = "";//氏名
		boolean isAttend = false;
		//String classNum = "";//クラス番号
		Student student = null;//学生
		//Map<String, String> errors = new HashMap<>();// エラーメッセージ
		ClassNumDao cNumDao = new ClassNumDao();// クラス番号Daoを初期化
		//Teacher teacher = (Teacher) session.getAttribute("user");// ログインユーザーを取得
		LocalDate todaysDate = LocalDate.now();// LcalDateインスタンスを取得
		//int year = todaysDate.getYear();// 現在の年を取得
		//List<Integer> entYearSet = new ArrayList<>();//入学年度のリストを初期化

		//リクエストパラメータ―の取得 2
		//entYear = Integer.parseInt(req.getParameter("ent_year"));//入学年度
		no = req.getParameter("no");//学生番号
		//name = req.getParameter("name");//氏名
		//classNum = req.getParameter("class_num");//クラス番号

		School school = new School();
		school.setCd("oom");//学校コードをセットする
		school.setName("テスト校");//学校名をセットする

		Teacher teacher = new Teacher();
		teacher.setId("admin1");//講師IDをセット
		teacher.setName("管理者１");//講師名をセット
		teacher.setPassword("password");//ログインパスワードをセット
		teacher.setSchool(school);//学校オブジェクトをセット

		//DBからデータ取得 3
		student = sDao.get(no);// 学生番号から学生インスタンスを取得
		List<String> list = cNumDao.filter(teacher.getSchool());// ログインユーザーの学校コードをもとにクラス番号の一覧を取得

		//ビジネスロジック 4
		//DBへデータ保存 5
		//条件で手順4~5の内容が分岐

		entYear = student.getEntYear();
		name = student.getName();
		isAttend = student.isAttend();

		//エラーがあったかどうかで手順6~7の内容が分岐
		//レスポンス値をセット 6
		//JSPへフォワード 7
		req.setAttribute("name", name);//クラス番号のlistをセット
		req.setAttribute("ent_year", entYear);//入学年度のlistをセット
		req.setAttribute("no", no);//入学年度のlistをセット
		req.setAttribute("class_num_set", list);//入学年度のlistをセット
		req.setAttribute("isattend_set", isAttend);//入学年度のlistをセット


		req.getRequestDispatcher("student_update.jsp").forward(req, res);
	}
}
