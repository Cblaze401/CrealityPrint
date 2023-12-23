#pragma once

#ifndef CXCLOUD_MODEL_QRCODE_IMAGE_PROVIDER_H_
#define CXCLOUD_MODEL_QRCODE_IMAGE_PROVIDER_H_

#include <QtCore/QObject>
#include <QtQuick/QQuickImageProvider>

#include "cxcloud/interface.hpp"

namespace cxcloud {

class CXCLOUD_API QrcodeImageProvider : public QObject
                                      , public QQuickImageProvider {
public:
  explicit QrcodeImageProvider(QObject* parent = nullptr);
  virtual ~QrcodeImageProvider() = default;

public:
  QImage requestImage(const QString& id, QSize* size, const QSize& requested_size) override;

public:
  QString getUrl() const;
  void setUrl(const QString& url);

private:
  QString url_;
};

}  // namespace cxcloud

#endif  // CXCLOUD_MODEL_QRCODE_IMAGE_PROVIDER_H_
