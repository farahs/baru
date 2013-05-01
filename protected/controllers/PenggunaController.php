<?php

class PenggunaController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','create','verifikasi','lupa','daftar','kirim','kirimpwd','notiflupa','salahemail'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('view','update','upload','viewwishlist'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				// 'users'=>array('admin'),
				'expression'=>'$users->isAdmin()'
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$model=$this->loadModel($id);
		$profil=$model->profils;
		//$foto = new Foto();
		//echo $model->profils->username;
		//$foto = $profil->$fotos1;
		

		if(isset($_POST['Foto']))
		{
			$foto = new Foto();
			$foto->attributes=$_POST['Foto'];
			$gambar = CUploadedFile::getInstance($foto,'foto');
			$foto->username = $profil->username;
			$foto->profil_id = $profil->id;
			$path = Yii::app()->basePath.'/../images/gallery/';

				if(!empty($gambar))
				{
					$foto->url=$gambar->name;
					if($foto->save())
						$gambar->saveAs($path.$gambar);
				}
		}

		$this->render('view',array(
			'model'=>$this->loadModel($id),
			'pt'=>Pengunjungterdaftar::model()->find('username=?',array($this->id)),
			'profil'=>Profil::model()->find('username=?',array($this->id)),
			'foto'=>Foto::model()->find('username=?',array($this->id)),
			'wishlist'=>Wishlist::model()->find('username=?',array($this->id)),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Pengguna;
		$pt= new Pengunjungterdaftar;
		$profil=new Profil;

		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);

		if(isset($_POST['Pengguna'], $_POST['Pengunjungterdaftar']))
		{
			$model->attributes = $_POST['Pengguna'];
			$pt->attributes = $_POST['Pengunjungterdaftar'];
			$profil->attributes = $_POST['Profil'];

			$model->isAktif=0;
			$model->kodeDaftar=md5(rand(0,1000000));

			$pt->username = $model->username;
			$profil->username = $model->username;

			$foto=CUploadedFile::getInstance($profil,'avatar');
			// $profil->avatar = $foto->name;
			$path=Yii::app()->basePath . '/../images/avatar/';			

			if($pt->save() && $pt->validate())
			{
				if($model->save() && $model->validate())
				{
					if($profil->save() && $profil->validate())
					{
						if(!empty($foto)){
							$profil->avatar = $foto->name;
							$foto->saveAs($path.$foto);
						}

						// $email = Yii::app()->email;
						// $email->from = "farah.shafira@gmail.com";
						// $email->to = $pt->email;
						// $email->subject = "[Exoticnesia] Verifikasi Pendaftaran";
						// $email->view='emailDaftar';
						// $email->viewVars=array('pengguna' => $model, 'pengunjungterdaftar' => $pt, 'profil'=>$profil);
						// $email->send();
						// //testing kirim jadi tampilan view
						// //$this->redirect('kirim',array('pengguna' => $model, 'pengunjungterdaftar' => $pt, 'profil'=>$profil));
						// $to       = 'farah.shafira@gmail.com';
						// $subject  = 'Testing sendmail.exe';
						// $message  = 'Hi, you just received an email using sendmail!';
						// $headers  = 'From: sender@gmail.com' . "\r\n" .
						//             'Reply-To: sender@gmail.com' . "\r\n" .
						//             'MIME-Version: 1.0' . "\r\n" .
						//             'Content-type: text/html; charset=iso-8859-1' . "\r\n" .
						//             'X-Mailer: PHP/' . phpversion();
						// if(mail($to, $subject, $message, $headers))
						//     echo "Email sent";
						// else
						//     die("Email sending failed");
						// if($email->send()){
						// // 	//menampilkan notifikasi
							$this->redirect(array('daftar','id'=>$model->username));
						// }
						// else {
							// $this->redirect(array('salahemail', 'id'=>$model->username));
						// }
					}
				} 
			}
				// $this->redirect(array('view','id'=>$model->username));
		}

		$this->render('create',array(
			'model'=>$model,
			'pt'=>$pt,
			'profil'=>$profil,
		));
	}

	public function actionKirim($model,$pt,$profil)
	{
		//belum bisa tampilin ini
		$this->render('kirim', array(
			'pengguna' => $model, 'pengunjungterdaftar' => $pt, 'profil'=>$profil)
		);
	}

	public function actionSalahemail($id)
	{
		// $this->loadModel($id)->delete();
		// $pengguna = Pengguna::model()->findByPk($id);
		// $profil = Profil::model()->find('username=?',array($id));
		$pt = Pengunjungterdaftar::model()->findByPk($id)->delete();
		$pt->actionDelete($id);
		// $profil->delete();
		// $pengguna->delete();
		// $pt->delete();
		$this->render('salahemail',array(
			'id'=>$id,
		));
	}

	public function actionDaftar($id)
	{
		$this->render('daftar',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	* Ketika pengguna melakukan pendaftaran, harus melakukan verifikasi terlebih dahulu
	* sebelum dapat login ke sistem
	*/
	public function actionVerifikasi($kode)
	{
		$model = Pengguna::model()->find('kodeDaftar=?',array($kode));
		// $model = $this->loadModel('username');
		$model->isAktif = 1;
		$this.render('verifikasi');
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
		$pt=$model->username0;
		$profil=$model->profils;

		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);
		
		if(isset($_POST['Profil'], $_POST['Pengunjungterdaftar']))
		{
			$_POST['Pengunjungterdaftar']['Username'] = $pt->username;
			$_POST['Pengunjungterdaftar']['Password'] = $pt->password;
			$pt->attributes = $_POST['Pengunjungterdaftar'];
			$profil->attributes = $_POST['Profil'];

			$pt->username = $model->username;
			$model->username = $profil->username;

			$foto=CUploadedFile::getInstance($profil,'avatar');
			$path=Yii::app()->basePath . '/../images/avatar/';

			if($pt->save()){
				if($model->save()){ 
					if(!empty($foto)){
						$profil->avatar = $foto->name;
						if($profil->save()) {
							$foto->saveAs($path.$foto);
						}
					}
					else{
						$profil->save();
					}
					Yii::app()->user->setFlash('success', "Profil berhasil diubah!");
					$this->redirect(array('view', 'id'=>$model->username));
				}
			}
		}

		$this->render('update',array(
			'model'=>$model,
			'pt'=>$pt,
			'profil'=>$profil,
		));
	}

	public function actionViewwishlist()
	{
	 	$model=$this->loadModel(Yii::app()->user->id);
                
        $dataProvider=new CActiveDataProvider('container',array(
        'criteria'=>array('condition'=> 'username=\''.$model->username.'\''),
        'pagination'=>array('pageSize'=>20)));
                
		$this->render('createwishlist',array(
			'dataProvider'=>$dataProvider,
                        'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Pengguna');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Pengguna('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Pengguna']))
			$model->attributes=$_GET['Pengguna'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	* Mengambil password
	*/
	public function actionLupa()
	{
		$model=new Pengunjungterdaftar;
		//$this->performAjaxValidation($model);

		if (isset($_POST['Pengunjungterdaftar']))
		{
			$email=$_POST['Pengunjungterdaftar']['email'];
			$model = Pengunjungterdaftar::model()->find('email=?',array($email));

			if ($model !== null) 
			{
				$email = Yii::app()->email;
				$email->from = "farah.shafira@gmail.com";
				$email->to = $model->email;
				$email->subject = "[Exoticnesia] Lupa Password";
				$email->view='kirimpwd';
				$email->viewVars=array('pengunjungterdaftar' => $model);
				//$email->send();
				//testing kirim jadi tampilan view
				//$this->redirect('kirimpwd',array('pengunjungterdaftar' => $model));
				//if($email->send()){
					//menampilkan notifikasi
					$this->redirect(array('notiflupa','id'=>$model->username));
				//}
			}
			else
			{
				//Kalo email nggak terdaftar masih nggakbisa ngehandle
				Yii::app()->user->setFlash('error', "Alamat e-mail tidak terdaftar!");
				$this->refresh();
			}
		}
		$this->render('lupa', array('model' => $model));
	}

	public function actionKirimpwd($id)
	{
		//belum bisa tampilin ini
		$this->render('kirimpwd',array('pengunjungterdaftar' => $id));
	}

	public function actionUpload($id)
	{
		$model=$this->loadModel($id);
		$profil=$model->profils;
		$foto = new Foto();
		echo $model->profils->username;
		//$foto = $profil->$fotos1;
		$path=Yii::app()->basePath . '/../images/gallery/' .$model->username .'/';

		if(isset($_POST['Foto']))
		{
			$foto->attributes=$_POST['Foto'];
			$foto->image = CUploadedFile::getInstance($model,'foto');
			$foto->username = $model->username;
			$foto->profil_id = $profil->id;
			if($foto->save() && $foto->validate()){
				$foto->url->saveAs($path);
				Yii::app()->user->setFlash('success', "Foto berhasil di upload!");
			}
			else {
				Yii::app()->user->setFlash('error', "Foto gagal di upload!");
			}
		}
		$this->render('upload',array('id'=>$model->username));
	}

	public function actionNotiflupa($id)
	{
		$this->render('notiflupa',array('pengunjungterdaftar' => $id));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Pengguna the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Pengguna::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}
	/**
	 * Performs the AJAX validation.
	 * @param Pengguna $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='pengguna-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}