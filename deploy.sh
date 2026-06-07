#!/bin/bash
set -e
echo ""
echo "🚨 ALARMA CIUDADANA — Deploy automático"
echo "======================================="
echo ""

# 1. Git
git init 2>/dev/null || true
git add -A
git commit -m "🚨 Alarma Ciudadana — update $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || echo "Nada nuevo que commitear"

# 2. Remote
if ! git remote get-url origin &>/dev/null; then
  git remote add origin git@github.com:cmendesverde/-Alarma-_Ciudadana.git
fi
git branch -M main
git push -u origin main

echo ""
echo "✅ GitHub actualizado"
echo ""

# 3. Vercel
if ! command -v vercel &>/dev/null; then
  echo "Instalando Vercel CLI..."
  npm install -g vercel
fi

echo "Desplegando en Vercel..."
vercel --prod --yes

echo ""
echo "✅ Listo. Copia la URL de arriba y compártela."
