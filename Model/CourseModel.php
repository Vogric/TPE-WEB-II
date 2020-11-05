<?php
require_once 'Model/BaseModel.php';
class CourseModel extends BaseModel
{
    private $db;
    public function __construct()
    {
        $this->db = $this->createConection();
    }

    public function getCourses()
    {
        $sentence = $this->db->prepare(
            "SELECT course.*, subject.title as subject
             FROM course JOIN subject ON course.id_subject = subject.id " );
        $sentence->execute();
        return $sentence->fetchAll( PDO::FETCH_OBJ );
    }

    public function getCourseDetail( $id_course )
    {
        $sentence = $this->db->prepare(
            "SELECT course.*, subject.title as subject
             FROM course JOIN subject ON course.id_subject = subject.id
             WHERE course.id=? " );
        $sentence->execute( array( $id_course ) );
        return $sentence->fetch( PDO::FETCH_OBJ );
    }

    public function addCourse( $new_course )
    {
        $sentence = $this->db->prepare(
            "INSERT INTO course(title, duration, time_commitent,
                                id_subject, difficulty, topics)
             VALUES(?,?,?,?,?,?)" );
        $sentence->execute( $new_course );
    }

    public function updateCourse( $course_id, $course_data )
    {
        $sentence = $this->db->prepare(
            "UPDATE course SET
                    title = ?, duration = ?, time_commitent = ?,
                    id_subject = ?, difficulty = ?, topics = ?
             WHERE course.id = ?" );

        $values = $course_data;
        array_push( $values, $course_id );

        $sentence->execute( $values );
    }

    public function deleteCourse( $course_id )
    {
        $sentence = $this->db->prepare( "DELETE FROM course WHERE id=?" );
        $sentence->execute( array( $course_id ) );
    }

}