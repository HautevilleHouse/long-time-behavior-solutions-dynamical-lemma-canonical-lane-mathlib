import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure BifurcationAnalysisPackage {A : GlobalAttractorPackage}
    (P : ParameterSpace) where
  parameterSpace : Type u
  topology : TopologicalSpace parameterSpace
  bifurcationPoint : parameterSpace → Prop
  attractorChange : Prop
  structuralStability : Prop

structure BifurcationAnalysisEvidence {A : GlobalAttractorPackage}
    {P : ParameterSpace} (B : BifurcationAnalysisPackage A P) where
  bifurcationPointClosed : ∀ p, B.bifurcationPoint p
  attractorChangeClosed : B.attractorChange
  structuralStabilityClosed : B.structuralStability

def BifurcationAnalysisClosed {A : GlobalAttractorPackage}
    {P : ParameterSpace} (B : BifurcationAnalysisPackage A P) : Prop :=
  (∀ p, B.bifurcationPoint p) ∧ B.attractorChange ∧ B.structuralStability

theorem bifurcation_analysis_closed_from_evidence {A : GlobalAttractorPackage}
    {P : ParameterSpace} (B : BifurcationAnalysisPackage A P)
    (E : BifurcationAnalysisEvidence B) : BifurcationAnalysisClosed B :=
  And.intro E.bifurcationPointClosed (And.intro E.attractorChangeClosed E.structuralStabilityClosed)

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse