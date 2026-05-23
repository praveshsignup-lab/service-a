{{- define "service.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "service.labels" -}}
{{- range $k, $v := .Values.labels }}
{{ $k }}: {{ $v | quote }}
{{- end -}}
{{- end -}}

{{- define "service.selectorLabels" -}}
app.kubernetes.io/name: {{ index .Values.labels "app.kubernetes.io/name" | quote }}
{{- end -}}
