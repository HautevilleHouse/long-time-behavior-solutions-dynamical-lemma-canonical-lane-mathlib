import canonicalLaneMathlib.LyapunovFunction

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure LaSalleInvariancePackage {M : LTBDAdmittedObject}
    (L : LyapunovFunctionPackage M) where
  invariantSet : Type u
  containment : Prop
  limitSetInInvariant : Prop

def LaSalleInvarianceClosed {M : LTBDAdmittedObject}
    {L : LyapunovFunctionPackage M} (P : LaSalleInvariancePackage L) : Prop :=
  P.containment ∧ P.limitSetInInvariant

theorem la_salle_closed {M : LTBDAdmittedObject}
    {L : LyapunovFunctionPackage M} (P : LaSalleInvariancePackage L) : LaSalleInvarianceClosed P := by
  exact And.intro P.containment P.limitSetInInvariant

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse