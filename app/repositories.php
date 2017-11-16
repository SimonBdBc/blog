<?php
/**
   * Récupére l'objet PDORow
   * @return PDO
   */
function getPDO(){
  $dsn = "mysql:dbname=blog;host=127.0.0.1;charset=UTF8";
  $username = "root";
  $password = "0000";
  $pdo = new PDO($dsn, $username, $password);
  return $pdo;
}
/**
   *  Récupére un article depuis son ID
   *  @param $id int
   *  @return void | array
   */
function getArticle($id){
  $pdo = getPDO();
  $query = "SELECT * FROM `articles` WHERE `idarticles` = ?;";
  $prepare = $pdo->prepare($query);
//bindParam le 1
  $prepare->bindParam(1, $id, PDO::PARAM_INT);
//$result donne un booleen
  $result = $prepare->execute();
//si $result == vrai return $prepare
  if($result == true){
//->fetch va chercher un article (fetchAll pour tous les articles)
    return $prepare->fetch();
  }
}
function getAuthor($id){
  $pdo = getPDO();
  $query = "SELECT `first_name`, `last_name` FROM `users` WHERE `idusers` = ?;";
  $prepare = $pdo->prepare($query);
//bindParam le 1
  $prepare->bindParam(1, $id, PDO::PARAM_INT);
//$result donne un booleen
  $result = $prepare->execute();
//si $result == vrai return $prepare
  if($result == true){
//->fetch va chercher un article (fetchAll pour tous les articles)
    return $prepare->fetch();
  }
}
