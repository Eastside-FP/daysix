import Data.Map (Map)
import qualified Data.Map as Map

type StudentId = Int
type CourseId = String

students :: Map.Map StudentId String
students = Map.fromList [
  ( 1001, "Leon Kelly" ),
  ( 1004, "Janice Olson" ),
  ( 1007, "Rudolph Sparks" ),
  ( 1008, "Brent Phelps" ),
  ( 1013, "Rodney Morgan" ),
  ( 1014, "Ted Hart" ),
  ( 1015, "Jaime Klein" ),
  ( 1018, "Felipe Reynolds" ),
  ( 1024, "Randall Castillo" ),
  ( 1026, "Bernadette Tyler" )] 

sections :: Map.Map CourseId String
sections = Map.fromList [
  ( "ah",  "Art History" ),
  ( "bw",  "Basket Weaving" ),
  ( "cs1", "Computer Science 1" ),
  ( "cs2", "Computer Science 2" ),
  ( "fr1", "French 1" ),
  ( "fr2", "French 2" ),
  ( "h1",  "History 1"),
  ( "h2",  "History 2"),
  ( "sp1", "Spanish 1" ),
  ( "sp2", "Spanish 2" )
  ]

enrollments :: Map.Map StudentId [ CourseId ]
enrollments = Map.fromList [
  ( 1001, ["fr1", "ah", "sp2", "h1"] ),
  ( 1004, ["sp2", "fr2", "fr1", "h2"] ),
  ( 1007, ["sp1", "sp2", "h2", "fr2"] ),
  ( 1008, ["geo", "sp1", "ah", "cs2"] ),
  ( 1013, ["fr2", "h2", "cs2", "ah"] ),
  ( 1014, ["sp1", "sp2", "fr1", "cs2"] ),
  ( 1015, ["fr2", "sp1", "cs2", "h1"] ),
  ( 1018, ["sp2", "fr1", "sp1", "h1"] ),
  ( 1024, ["h1", "sp1", "bw", "fr2"] ),
  ( 1026, ["h1", "fr1", "bw", "fr2"] )
  ]

nameOfCourse cid = Map.findWithDefault "UNKNOWN" cid sections

classesForStudent :: StudentId -> Maybe ( String, [ String ] )
classesForStudent sid = do
  name    <- Map.lookup sid students
  courses <- Map.lookup sid enrollments
  let courseNames = map nameOfCourse courses
  return ( name, courseNames )

classesForAll =
  map classesForStudent (Map.keys students)
