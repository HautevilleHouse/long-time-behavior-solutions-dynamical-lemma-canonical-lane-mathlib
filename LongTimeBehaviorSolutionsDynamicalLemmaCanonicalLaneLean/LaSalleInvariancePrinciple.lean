import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure LaSalleInvariancePrinciplePackage where
  lyapunovFunction : LyapunovFunctionPackage
  invariantSet : Set (Type u)
  convergenceToInvariantSet : Prop
  equilibriumAttractivity : Prop

structure LaSalleInvariancePrincipleEvidence (P : LaSalleInvariancePrinciplePackage) where
  convergenceToInvariantSetClosed : P.convergenceToInvariantSet
  equilibriumAttractivityClosed : P.equilibriumAttractivity

def LaSalleInvariancePrincipleClosed (P : LaSalleInvariancePrinciplePackage) : Prop :=
  P.convergenceToInvariantSet ∧ P.equilibriumAttractivity

theorem la_salle_invariance_principle_closed_from_evidence (P : LaSalleInvariancePrinciplePackage) (E : LaSalleInvariancePrincipleEvidence P) : LaSalleInvariancePrincipleClosed P := by
  exact And.intro E.convergenceToInvariantSetClosed E.equilibriumAttractivityClosed

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse
