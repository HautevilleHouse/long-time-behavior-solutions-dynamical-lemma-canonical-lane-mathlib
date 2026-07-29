import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure SurgeryPackage {A : AdmissibleClass} where
  surgeryTimesDiscrete : Prop
  surgeryRegionAdmissible : Prop
  postSurgeryMetricControlled : Prop
  monotonicitySurvivesSurgery : Prop
  topologyChangeAccounted : Prop

structure SurgeryEvidence {A : AdmissibleClass} (U : SurgeryPackage) where
  surgeryTimesDiscreteClosed : U.surgeryTimesDiscrete
  surgeryRegionAdmissibleClosed : U.surgeryRegionAdmissible
  postSurgeryMetricControlledClosed : U.postSurgeryMetricControlled
  monotonicitySurvivesSurgeryClosed : U.monotonicitySurvivesSurgery
  topologyChangeAccountedClosed : U.topologyChangeAccounted

def SurgeryClosed {A : AdmissibleClass} (U : SurgeryPackage) : Prop := 
  U.surgeryTimesDiscrete ∧ U.surgeryRegionAdmissible ∧ U.postSurgeryMetricControlled ∧ U.monotonicitySurvivesSurgery ∧ U.topologyChangeAccounted

theorem surgery_closed_from_evidence {A : AdmissibleClass} (U : SurgeryPackage) (E : SurgeryEvidence U) : SurgeryClosed U := by
  exact And.intro E.surgeryTimesDiscreteClosed (And.intro E.surgeryRegionAdmissibleClosed (And.intro E.postSurgeryMetricControlledClosed (And.intro E.monotonicitySurvivesSurgeryClosed E.topologyChangeAccountedClosed)))

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse