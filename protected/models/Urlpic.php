<?php

/**
 * This is the model class for table "urlpic".
 *
 * The followings are the available columns in table 'urlpic':
 * @property string $namadaerah
 * @property string $urlpic
 *
 * The followings are the available model relations:
 * @property Infonesia $namadaerah0
 */
class Urlpic extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Urlpic the static model class
	 */
	public $gambar_daerah;
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'urlpic';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('namadaerah, urlpic, gambar_daerah', 'required'),
			array('namadaerah', 'length', 'max'=>50),
			array('urlpic', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('namadaerah, urlpic', 'safe', 'on'=>'search'),


			array('gambar_daerah','file','types'=>'jpeg,jpg,png','allowEmpty'=>false),


			array('urlpic', 'file', 'types' => 'jpg, jpeg, gif, png', 'allowEmpty' => false),

		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'namadaerah0' => array(self::BELONGS_TO, 'Infonesia', 'namadaerah'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'namadaerah' => 'Namadaerah',
			'urlpic' => 'Urlpic',
			'gambar_daerah' => 'Gambar Daerah',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('namadaerah',$this->namadaerah,true);
		$criteria->compare('urlpic',$this->urlpic,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}