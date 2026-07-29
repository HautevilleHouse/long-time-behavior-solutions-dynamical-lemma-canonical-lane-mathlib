import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure AttractorStructurePackage where
  attractorSet : Type
  basinOfAttraction : Type
  lyapunovFunction : Type
  attractorCompact : Prop
  basinOpen : Prop
  lyapunovDecay : Prop

structure AttractorStructureEvidence (P : AttractorStructurePackage) where
  attractorCompactClosed : P.attractorCompact
  basinOpenClosed : P.basinOpen
  lyapunovDecayClosed : P.lyapunovDecay

def AttractorStructureClosed (P : AttractorStructurePackage) : Prop := 
  P.attractorCompact ∧ P.basinOpen ∧ P.lyapunovDecay

theorem attractor_structure_closed_from_evidence (P : AttractorStructurePackage) (E : AttractorStructureEvidence P) : AttractorStructureClosed P := by
  exact And.intro E.attractorCompactClosed (And.intro E.basinOpenClosed E.lyapunovDecayClosed)

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse