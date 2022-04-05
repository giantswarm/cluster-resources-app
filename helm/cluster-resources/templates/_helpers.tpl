# TEMPLATE-APP: This is set as a reasonable default, feel free to change.

{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "labels.common" -}}
{{ include "labels.selector" . }}
app.kubernetes.io/name: {{ .Values.name }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.giantswarm.io/branch: {{ .Chart.Annotations.branch | replace "#" "-" | replace "/" "-" | replace "." "-" | trunc 63 | trimSuffix "-" | quote }}
app.giantswarm.io/commit: {{ .Chart.Annotations.commit | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ include "chart" . | quote }}
giantswarm.io/service-type: {{ .Values.serviceType }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "labels.selector" -}}
app.kubernetes.io/name: {{ include "name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}

{{- define "waitForCiliumCRDs.name" -}}
{{- printf "%s-%s" ( include "name" . ) "wait-for-cilium-crds" | replace "+" "_" | trimSuffix "-" -}}
{{- end -}}

{{- define "waitForCiliumCRDs.annotations" -}}
"helm.sh/hook": "pre-install,pre-upgrade"
{{- end -}}

{{- define "waitForCiliumCRDs.selectorLabels" -}}
app.kubernetes.io/name: "{{ template "waitForCiliumCRDs.name" . }}"
app.kubernetes.io/instance: "{{ template "waitForCiliumCRDs.name" . }}"
{{- end -}}

{{/* Create a label which can be used to select any orphaned waitForCiliumCRDsl hook resources */}}
{{- define "waitForCiliumCRDs.selector" -}}
{{- printf "%s" "wait-for-cilium-crds-hook" -}}
{{- end -}}