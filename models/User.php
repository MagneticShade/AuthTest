<?php

namespace app\models;
use Yii;
use yii\web\IdentityInterface;
/**
 * This is the model class for table "users".
 *
 * @property int $id
 * @property string $name
 * @property string|null $middlename
 * @property string $surname
 * @property string $email
 * @property string $login
 * @property string $password
 * @property int $role
 *
 * @property Role $role0
 */
class User extends \yii\db\ActiveRecord implements IdentityInterface
{

    public $password_repeat;
    public $rules;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'users';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'surname', 'email', 'login', 'password','password_repeat'], 'required'],
            [['name', 'surname', 'middlename'], 'match', 'pattern' => '/^[а-яёА-ЯЁ -]*$/u', 'message' => 'Разрешены только кириллица, пробел или тире'],
            [['role'], 'integer'],
            [['login'],'unique'],
            ['login', 'match', 'pattern' => '/^[a-z]\w*$/i'],
            [['name', 'middlename', 'surname', 'login', 'password'], 'string', 'max' => 50],
            [['password'], 'string', 'min' => 6],
            ['password_repeat', 'compare', 'compareAttribute' => 'password'],
            [['email'],'unique'],
            ['email', 'email', 'message' => 'Введите правильный email'],
            ['rules', 'compare', 'compareValue' => 1, 'message' => 'Необходимо принять условия регистрации'],
            [['role'], 'exist', 'skipOnError' => true, 'targetClass' => Role::class, 'targetAttribute' => ['role' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'ИМЯ',
            'middlename' => 'ОТЧЕСТВО',
            'surname' => 'ФАМИЛИЯ',
            'email' => 'Email',
            'login' => 'ЛОГИН',
            'password' => 'ПАРОЛЬ',
            'password_repeat'=>'ПОВТОРИТЕ ПАРОЛЬ',
            'rules'=>'соглашение об обработке персональных данных',
            'role' => 'Role',
        ];
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return User::findOne(['login'=>$username]);
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return false;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->password === md5($password);
    }

    /**
     * Gets query for [[Role0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRole0()
    {
        return $this->hasOne(Role::class, ['id' => 'role']);
    }

    public function beforeSave($insert){
        $this->password=md5($this->password);
        return parent::beforeSave($insert);
    }
}
