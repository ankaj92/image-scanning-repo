# 🐳 Image Scanning with Trivy – Java + Gradle + GitHub Actions

## 📘 Overview

This project integrates **Trivy**, an open-source container image scanning tool, into a CI/CD pipeline for a Java application built with **Gradle**. The goal is to automate security checks on Docker images for known vulnerabilities.

> ✅ Build Tool: **Gradle + Wrapper**
> ✅ CI Platform: **GitHub Actions**
> ✅ Base Image: `openjdk:17-jdk`

---

## 🎯 Objectives

- Automate image scanning in CI/CD
- Detect critical and high-severity CVEs
- Export reports as artifacts (JSON)
- Display scan summary in logs

---

## 🐋 What is a Container Image?

A **container image** is a lightweight package containing the runtime, libraries, app code, and dependencies. A **container** is a running instance of this image.

> Image = Blueprint, Container = Running Instance

---

## 🧰 Tools Used

| Tool               | Purpose                           |
| ------------------ | --------------------------------- |
| **Trivy**          | Vulnerability scanning for images |
| **Docker**         | Image build and run               |
| **GitHub Actions** | CI/CD Pipeline Integration        |

---

## 🗂️ Project Structure

```
assignment6/
└── image-scanning-demo/
    ├── build.gradle
    ├── settings.gradle
    ├── Dockerfile
    ├── src/main/java/com/example/App.java
    └── .github/workflows/sca-docker-image.yml
```

---

## 📄 Dockerfile (Base Image)

```Dockerfile
FROM openjdk:17-jdk AS runtime

WORKDIR /app

COPY build/libs/image-scanning.jar /app/app.jar

CMD ["java", "-jar", "/app/app.jar"]
```

---

## ⚙️ GitHub Actions Workflow Highlights

```yaml
- Build Java project with ./gradlew
- Build Docker image: image-scanning-demo
- Install and run Trivy
- Export JSON report: trivy-report.json
- Show CRITICAL/HIGH findings in logs
- Upload report as artifact
```

---

## ✅ Scan Output Summary (Sample)

| Vulnerability ID | Package | Severity | Fix                  |
| ---------------- | ------- | -------- | -------------------- |
| CVE-2022-37434   | zlib    | HIGH     | Upgrade base image   |
| CVE-2021-37714   | glibc   | CRITICAL | Use updated OS image |
| CVE-2022-29458   | bash    | HIGH     | Rebuild with patches |

---

## 🛡️ Recommendations

- **Use minimal base images** like `eclipse-temurin:17-jre-alpine`
- **Rebuild Docker image** regularly to fetch upstream patches
- **Mitigate hardcoded secrets** (e.g., `hardcoded-password`)
- Use Trivy in both `table` and `json` formats for CI + reporting
- Add a scheduled scan trigger (weekly/cron)

---

## 🧪 Comparative: Trivy vs Docker Scout

| Feature           | Trivy         | Docker Scout   |
| ----------------- | ------------- | -------------- |
| Open Source       | ✅ Yes        | ⚠️ Partial     |
| Scan Accuracy     | ✅ High       | ✅ High        |
| Format Support    | ✅ JSON/SARIF | ✅ Table       |
| Ecosystem Support | ✅ Broad      | 🔒 Docker-only |

> 📌 Use Trivy for extensibility and community adoption.

---

## 📎 Submission Artifacts

- ✅ Dockerfile & CI Pipeline
- ✅ Trivy scan reports (JSON)
- ✅ Log summary of HIGH/CRITICAL vulnerabilities
- ✅ Recommendations & mitigation plan
- ✅ Optional: Tool comparison

---

## 📌 Conclusion

This pipeline demonstrates secure software delivery using **Trivy** for vulnerability scanning of container images. Integrated directly into GitHub Actions, this solution enables real-time visibility into high-risk CVEs, supports artifact-based audit trails, and enhances container security without adding friction to the development workflow.

---

## 🔗 References

- [Trivy Docs](https://aquasecurity.github.io/trivy)
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
