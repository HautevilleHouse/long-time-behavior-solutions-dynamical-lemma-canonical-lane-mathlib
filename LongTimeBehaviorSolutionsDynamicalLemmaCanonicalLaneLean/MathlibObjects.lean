import canonicalLaneMathlib.TheoremStatement
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure LTBDSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure LTBDAdmittedObject where
  space : LTBDSpace
  dynamicalSystem : Prop
  longTimeLimit : Prop
  solutionConverges : Prop
  conclusion : solutionConverges

structure LTBDEndgameState where
  object : LTBDAdmittedObject

def LTBDWitnessClosed (O : LTBDAdmittedObject) : Prop :=
  O.solutionConverges

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse